#include "profiler.h"

#ifdef RVE_PROFILE

#include <algorithm>
#include <cstring>

static const int PROF_SERIES_CAP = 4096; // >= longest history / shortest sampling period

const char *prof_class_name(int cls)
{
    static const char *names[PIC_COUNT] = {
        "ALU", "MUL", "DIV", "Load", "Store", "Branch", "JAL", "JALR", "LUI/AUIPC",
        "CSR", "Atomic", "FP", "System", "Fence", "Other"};
    return (cls >= 0 && cls < PIC_COUNT) ? names[cls] : "?";
}

const char *prof_stage_name(int stage)
{
    static const char *names[PSTAGE_COUNT] = {
        "Fetch (MMU + read)", "Decode + execute", "CLINT timers", "Devices (UART, virtio)", "Trap / IRQ entry, pc"};
    return (stage >= 0 && stage < PSTAGE_COUNT) ? names[stage] : "?";
}

const char *prof_region_name(int region)
{
    static const char *names[PREG_COUNT] = {
        "UART", "CLINT", "PLIC", "virtio-net", "Net buffers", "Keyboard", "RTC", "SYSCON", "DTB/flash", "Unmapped"};
    return (region >= 0 && region < PREG_COUNT) ? names[region] : "?";
}

const char *prof_exception_name(int cause)
{
    static const char *names[16] = {
        "Insn misaligned", "Insn access fault", "Illegal insn", "Breakpoint",
        "Load misaligned", "Load access fault", "Store misaligned", "Store access fault",
        "ECALL from U", "ECALL from S", "-", "ECALL from M",
        "Insn page fault", "Load page fault", "-", "Store page fault"};
    return names[cause & 15];
}

const char *prof_interrupt_name(int cause)
{
    switch (cause & 15)
    {
    case 1: return "S software";
    case 3: return "M software";
    case 5: return "S timer";
    case 7: return "M timer";
    case 9: return "S external";
    case 11: return "M external";
    }
    return "-";
}

// ---------------------------------------------------------------------------------------------
void ProfSeries::init(int capacity)
{
    cap = capacity;
    x.assign(cap, 0.0f);
    y.assign(cap, 0.0f);
    clear();
}

void ProfSeries::push(float xv, float yv)
{
    x[next] = xv;
    y[next] = yv;
    next = (next + 1) % cap;
    if (count < cap) count++;
}

float ProfSeries::maxValue() const
{
    float m = 0;
    for (int i = 0; i < count; i++) m = std::max(m, y[i]);
    return m;
}

// ---------------------------------------------------------------------------------------------
static uint64_t sumInsns(const ProfCounters &c)
{
    uint64_t n = 0;
    for (int i = 0; i < PIC_COUNT; i++) n += c.insns[i];
    return n;
}

static ProfCounters diff(const ProfCounters &a, const ProfCounters &b)
{
    ProfCounters r;
    const uint64_t *pa = reinterpret_cast<const uint64_t *>(&a);
    const uint64_t *pb = reinterpret_cast<const uint64_t *>(&b);
    uint64_t *pr = reinterpret_cast<uint64_t *>(&r);
    for (size_t i = 0; i < sizeof(ProfCounters) / sizeof(uint64_t); i++)
        pr[i] = pa[i] - pb[i];
    return r;
}

Profiler::Profiler()
{
    for (ProfSeries &s : stage_pct)
        s.init(PROF_SERIES_CAP);
    ns_per_insn.init(PROF_SERIES_CAP);
    for (ProfSeries *s : {&mips, &frame_ms, &emu_ms, &ui_ms, &rd_rate, &wr_rate, &mmio_rate, &walk_rate,
                          &ptw_rate, &fault_rate, &trap_rate, &irq_rate, &uart_tx_rate, &uart_rx_rate,
                          &vnet_tx_rate, &vnet_rx_rate})
        s->init(PROF_SERIES_CAP);
    for (int i = 0; i < PIC_COUNT; i++)
        cls_rate[i].init(PROF_SERIES_CAP);
}

ProfCounters Profiler::tot() const { return diff(cur, base); }
uint64_t Profiler::totalInsns() const { return sumInsns(cur) - sumInsns(base); }

void Profiler::clearHistory()
{
    for (ProfSeries *s : {&mips, &frame_ms, &emu_ms, &ui_ms, &rd_rate, &wr_rate, &mmio_rate, &walk_rate,
                          &ptw_rate, &fault_rate, &trap_rate, &irq_rate, &uart_tx_rate, &uart_rx_rate,
                          &vnet_tx_rate, &vnet_rx_rate})
        s->clear();
    for (int i = 0; i < PIC_COUNT; i++)
        cls_rate[i].clear();
    for (ProfSeries &s : stage_pct)
        s.clear();
    ns_per_insn.clear();
    run_secs = 0;
    mips_now = mips_avg = 0;
    frame_sum = emu_sum = 0;
    frame_n = 0;
}

void Profiler::reset()
{
    base = cur;
    vbase = vcur;
    clearHistory();
}

void Profiler::frameDone(double frame_ms_v, double emu_ms_v)
{
    frame_sum += frame_ms_v;
    emu_sum += emu_ms_v;
    frame_n++;
}

void Profiler::update(const ProfCounters &c, const VirtioNet::Stats &vs, bool run)
{
    uint64_t now = prof_now_ns();
    if (t_start_ns == 0)
        t_start_ns = t_last_ns = now;
    t_now = (double)(now - t_start_ns) * 1e-9;
    running = run;

    // The emulator was reset / a new image loaded: its counters restarted from zero
    if (sumInsns(c) < sumInsns(prev))
    {
        prev = ProfCounters{};
        vprev = VirtioNet::Stats{};
        base = ProfCounters{};
        vbase = VirtioNet::Stats{};
        clearHistory();
    }

    cur = c;
    vcur = vs;

    if (paused)
    {
        // keep the baseline moving so resuming does not show a huge spike
        prev = c;
        vprev = vs;
        t_last_ns = now;
        frame_sum = emu_sum = 0;
        frame_n = 0;
        return;
    }
    if (now - t_last_ns < (uint64_t)interval_ms * 1000000ull)
        return;

    double dt = (double)(now - t_last_ns) * 1e-9;
    ProfCounters d = diff(c, prev);
    VirtioNet::Stats dv;
    dv.tx_frames = vs.tx_frames - vprev.tx_frames;
    dv.tx_bytes = vs.tx_bytes - vprev.tx_bytes;
    dv.rx_frames = vs.rx_frames - vprev.rx_frames;
    dv.rx_bytes = vs.rx_bytes - vprev.rx_bytes;
    uint64_t dinsns = sumInsns(c) - sumInsns(prev);

    pushSample(dt, d, dv, dinsns);

    prev = c;
    vprev = vs;
    t_last_ns = now;
}

void Profiler::pushSample(double dt, const ProfCounters &d, const VirtioNet::Stats &dv, uint64_t dinsns)
{
    float x = (float)t_now;
    auto sum2 = [](const uint64_t (&a)[4][2], int rw) {
        uint64_t n = 0;
        for (int w = 0; w < 4; w++) n += a[w][rw];
        return n;
    };
    auto sumn = [](const uint64_t *a, int n) {
        uint64_t t = 0;
        for (int i = 0; i < n; i++) t += a[i];
        return t;
    };

    mips_now = (double)dinsns / dt * 1e-6;
    if (dinsns)
        run_secs += dt;
    mips_avg = run_secs > 0 ? (double)totalInsns() / run_secs * 1e-6 : 0;
    mips.push(x, (float)mips_now);

    for (int i = 0; i < PIC_COUNT; i++)
        cls_rate[i].push(x, (float)((double)d.insns[i] / dt));

    rd_rate.push(x, (float)((double)sum2(d.mem, 0) / dt));
    wr_rate.push(x, (float)((double)sum2(d.mem, 1) / dt));
    mmio_rate.push(x, (float)((double)(sumn(d.mmio[0], PREG_COUNT) + sumn(d.mmio[1], PREG_COUNT)) / dt));

    walk_rate.push(x, (float)((double)sumn(d.mmu_walks, 3) / dt));
    ptw_rate.push(x, (float)((double)d.ptw_reads / dt));
    fault_rate.push(x, (float)((double)sumn(d.mmu_faults, 3) / dt));
    trap_rate.push(x, (float)((double)sumn(d.traps, 16) / dt));
    irq_rate.push(x, (float)((double)sumn(d.irqs, 16) / dt));

    uart_tx_rate.push(x, (float)((double)d.uart_tx_bytes / dt));
    uart_rx_rate.push(x, (float)((double)d.uart_rx_bytes / dt));
    vnet_tx_rate.push(x, (float)((double)dv.tx_frames / dt));
    vnet_rx_rate.push(x, (float)((double)dv.rx_frames / dt));

    // Host-time breakdown for this interval: stage cost minus the timer-call overhead, as a share of the total
    if (d.samples)
    {
        double st[PSTAGE_COUNT], total = 0;
        for (int i = 0; i < PSTAGE_COUNT; i++)
        {
            st[i] = std::max(0.0, (double)d.stage_ns[i] - (double)d.timer_ns);
            total += st[i];
        }
        for (int i = 0; i < PSTAGE_COUNT; i++)
            stage_pct[i].push(x, total > 0 ? (float)(100.0 * st[i] / total) : 0.0f);
        ns_per_insn.push(x, (float)(total / (double)d.samples));
    }

    if (frame_n)
    {
        double f = frame_sum / frame_n, e = emu_sum / frame_n;
        frame_ms.push(x, (float)f);
        emu_ms.push(x, (float)e);
        ui_ms.push(x, (float)std::max(0.0, f - e));
    }
    frame_sum = emu_sum = 0;
    frame_n = 0;
}

#endif // RVE_PROFILE
