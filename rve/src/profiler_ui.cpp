// ImPlot front-end for Profiler (see profiler.h)
#include "profiler.h"

#ifdef RVE_PROFILE

#include "imgui.h"
#include "implot.h"
#include <cstdio>
#include <ctime>
#include <algorithm>
#include <initializer_list>

// ---- formatting ---------------------------------------------------------------------------

static int fmtSI(double v, char *buf, int n, void *unit)
{
    const char *u = unit ? (const char *)unit : "";
    double a = v < 0 ? -v : v;
    if (a >= 1e9) return snprintf(buf, n, "%.3g G%s", v / 1e9, u);
    if (a >= 1e6) return snprintf(buf, n, "%.3g M%s", v / 1e6, u);
    if (a >= 1e3) return snprintf(buf, n, "%.3g k%s", v / 1e3, u);
    return snprintf(buf, n, "%.3g %s", v, u);
}

// value with an SI suffix into a rotating set of buffers (usable several times in one printf)
static const char *si(double v, const char *unit = "")
{
    static char bufs[8][32];
    static int i = 0;
    char *b = bufs[i++ & 7];
    fmtSI(v, b, 32, (void *)unit);
    return b;
}

static double pct(uint64_t part, uint64_t whole) { return whole ? 100.0 * (double)part / (double)whole : 0.0; }

// ---- plot helpers ---------------------------------------------------------------------------

struct Trace
{
    const char *label;
    const ProfSeries *s;
};

static void linePlot(const Profiler &p, const char *id, const char *unit, std::initializer_list<Trace> traces, float h = 170)
{
    if (!ImPlot::BeginPlot(id, ImVec2(-1, h)))
        return;
    ImPlot::SetupAxes("t (s)", nullptr, ImPlotAxisFlags_None, ImPlotAxisFlags_AutoFit | ImPlotAxisFlags_RangeFit);
    ImPlot::SetupAxisFormat(ImAxis_Y1, fmtSI, (void *)unit);
    if (!p.paused) // follow the newest samples; when paused the view is free to pan/zoom
        ImPlot::SetupAxisLimits(ImAxis_X1, p.t_now - p.history_s, p.t_now, ImPlotCond_Always);
    ImPlot::SetupLegend(ImPlotLocation_NorthWest);
    for (const Trace &t : traces)
        if (t.s->count)
            ImPlot::PlotLine(t.label, t.s->x.data(), t.s->y.data(), t.s->count, ImPlotLineFlags_None, t.s->offset());
    ImPlot::EndPlot();
}

// Horizontal bars with one text label per bar
static void hbars(const char *id, const char *const *labels, const double *vals, int n, float h)
{
    static double pos[32];
    for (int i = 0; i < n && i < 32; i++) pos[i] = i;
    if (!ImPlot::BeginPlot(id, ImVec2(-1, h), ImPlotFlags_NoLegend | ImPlotFlags_NoMouseText))
        return;
    ImPlot::SetupAxes(nullptr, nullptr, ImPlotAxisFlags_AutoFit, ImPlotAxisFlags_AutoFit | ImPlotAxisFlags_Invert);
    ImPlot::SetupAxisFormat(ImAxis_X1, fmtSI, (void *)"");
    ImPlot::SetupAxisTicks(ImAxis_Y1, pos, n, labels);
    ImPlot::PlotBars("##bars", vals, n, 0.67, 0, ImPlotBarsFlags_Horizontal);
    ImPlot::EndPlot();
}

static void statCell(const char *label, const char *value)
{
    ImGui::TableNextColumn();
    ImGui::TextDisabled("%s", label);
    ImGui::Text("%s", value);
}

static void noData(const char *what)
{
    ImGui::TextDisabled("%s", what);
}

// ---- tabs ------------------------------------------------------------------------------------

static void tabOverview(const Profiler &p, const ProfCounters &t)
{
    uint64_t insns = p.totalInsns();
    uint64_t loads = 0, stores = 0;
    for (int w = 0; w < 4; w++) { loads += t.mem[w][0]; stores += t.mem[w][1]; }

    if (ImGui::BeginTable("kpis", 4, ImGuiTableFlags_SizingStretchSame))
    {
        char b[64];
        snprintf(b, sizeof b, "%.2f", p.mips_now);            statCell("MIPS (now)", b);
        snprintf(b, sizeof b, "%.2f", p.mips_avg);            statCell("MIPS (avg while running)", b);
        statCell("Instructions", si((double)insns));
        statCell("State", p.running ? "running" : "halted");
        snprintf(b, sizeof b, "%.1f", insns ? 1000.0 * (double)(loads + stores) / (double)insns : 0.0);
        statCell("Loads+stores / 1k insn", b);
        snprintf(b, sizeof b, "%.1f %%", pct(t.branch_taken, t.insns[PIC_BRANCH]));
        statCell("Branches taken", b);
        snprintf(b, sizeof b, "%.1f %%", pct(t.insns[PIC_LOAD] + t.insns[PIC_STORE], insns));
        statCell("Load/store insn share", b);
        snprintf(b, sizeof b, "%.3f", p.frame_ms.last());     statCell("Frame time (ms)", b);
        ImGui::EndTable();
    }
    linePlot(p, "Throughput", "MIPS", {{"MIPS", &p.mips}}, 170);
    linePlot(p, "Frame time", "ms", {{"frame", &p.frame_ms}, {"emulation", &p.emu_ms}, {"UI + render", &p.ui_ms}}, 170);
}

static void tabInstructions(const Profiler &p, const ProfCounters &t)
{
    uint64_t insns = p.totalInsns();
    static double vals[PIC_COUNT];
    static const char *labels[PIC_COUNT];
    for (int i = 0; i < PIC_COUNT; i++) { vals[i] = (double)t.insns[i]; labels[i] = prof_class_name(i); }

    hbars("Instruction mix", labels, vals, PIC_COUNT, 300);

    if (ImGui::BeginTable("insn table", 4, ImGuiTableFlags_RowBg | ImGuiTableFlags_SizingStretchSame))
    {
        ImGui::TableSetupColumn("Class");
        ImGui::TableSetupColumn("Count");
        ImGui::TableSetupColumn("Share");
        ImGui::TableSetupColumn("Rate (now)");
        ImGui::TableHeadersRow();
        for (int i = 0; i < PIC_COUNT; i++)
        {
            ImGui::TableNextRow();
            ImGui::TableNextColumn(); ImGui::TextUnformatted(prof_class_name(i));
            ImGui::TableNextColumn(); ImGui::Text("%llu", (unsigned long long)t.insns[i]);
            ImGui::TableNextColumn(); ImGui::Text("%.2f %%", pct(t.insns[i], insns));
            ImGui::TableNextColumn(); ImGui::Text("%s", si(p.cls_rate[i].last(), "/s"));
        }
        ImGui::EndTable();
    }
    ImGui::Text("Branches taken: %llu of %llu (%.1f %%)", (unsigned long long)t.branch_taken,
                (unsigned long long)t.insns[PIC_BRANCH], pct(t.branch_taken, t.insns[PIC_BRANCH]));
    ImGui::Text("Instructions fetched: %llu (%s of instruction bytes)", (unsigned long long)insns, si((double)insns * 4, "B"));
    ImGui::Text("Fetch faults (misaligned pc / page fault): %llu", (unsigned long long)t.fetch_faults);

    if (ImPlot::BeginPlot("Instruction rate by class", ImVec2(-1, 220)))
    {
        ImPlot::SetupAxes("t (s)", nullptr, ImPlotAxisFlags_None, ImPlotAxisFlags_AutoFit | ImPlotAxisFlags_RangeFit);
        ImPlot::SetupAxisFormat(ImAxis_Y1, fmtSI, (void *)"/s");
        if (!p.paused)
            ImPlot::SetupAxisLimits(ImAxis_X1, p.t_now - p.history_s, p.t_now, ImPlotCond_Always);
        ImPlot::SetupLegend(ImPlotLocation_NorthWest, ImPlotLegendFlags_Horizontal | ImPlotLegendFlags_Outside);
        for (int i = 0; i < PIC_COUNT; i++)
        {
            const ProfSeries &s = p.cls_rate[i];
            if (s.count)
                ImPlot::PlotLine(prof_class_name(i), s.x.data(), s.y.data(), s.count, ImPlotLineFlags_None, s.offset());
        }
        ImPlot::EndPlot();
    }
}

static void tabMemory(const Profiler &p, const ProfCounters &t)
{
    uint64_t rd = 0, wr = 0, rdb = 0, wrb = 0, mmio_rd = 0, mmio_wr = 0;
    static const int widthBytes[4] = {1, 2, 4, 8};
    for (int w = 0; w < 4; w++)
    {
        rd += t.mem[w][0]; wr += t.mem[w][1];
        rdb += t.mem[w][0] * widthBytes[w]; wrb += t.mem[w][1] * widthBytes[w];
    }
    for (int r = 0; r < PREG_COUNT; r++) { mmio_rd += t.mmio[0][r]; mmio_wr += t.mmio[1][r]; }

    linePlot(p, "Guest data accesses", "acc/s", {{"reads", &p.rd_rate}, {"writes", &p.wr_rate}, {"MMIO (r+w)", &p.mmio_rate}}, 190);

    // reads / writes by access width
    {
        static double v[2 * 4];
        for (int w = 0; w < 4; w++) { v[0 * 4 + w] = (double)t.mem[w][0]; v[1 * 4 + w] = (double)t.mem[w][1]; }
        static const char *items[2] = {"Read", "Write"};
        static const char *groups[4] = {"8-bit", "16-bit", "32-bit", "64-bit"};
        static const double gpos[4] = {0, 1, 2, 3};
        if (ImPlot::BeginPlot("Accesses by width", ImVec2(ImGui::GetContentRegionAvail().x * 0.5f - 4, 200)))
        {
            ImPlot::SetupAxes(nullptr, nullptr, ImPlotAxisFlags_AutoFit, ImPlotAxisFlags_AutoFit);
            ImPlot::SetupAxisTicks(ImAxis_X1, gpos, 4, groups);
            ImPlot::SetupAxisFormat(ImAxis_Y1, fmtSI, (void *)"");
            ImPlot::PlotBarGroups(items, v, 2, 4, 0.67, 0);
            ImPlot::EndPlot();
        }
    }
    ImGui::SameLine();
    // MMIO by device
    {
        static double v[PREG_COUNT];
        static const char *labels[PREG_COUNT];
        double total = 0;
        for (int r = 0; r < PREG_COUNT; r++)
        {
            v[r] = (double)(t.mmio[0][r] + t.mmio[1][r]);
            labels[r] = prof_region_name(r);
            total += v[r];
        }
        if (ImPlot::BeginPlot("MMIO by device", ImVec2(-1, 200), ImPlotFlags_Equal | ImPlotFlags_NoMouseText))
        {
            ImPlot::SetupAxes(nullptr, nullptr, ImPlotAxisFlags_NoDecorations, ImPlotAxisFlags_NoDecorations);
            ImPlot::SetupAxesLimits(0, 1, 0, 1);
            ImPlot::SetupLegend(ImPlotLocation_East, ImPlotLegendFlags_Outside);
            if (total > 0)
                ImPlot::PlotPieChart(labels, v, PREG_COUNT, 0.5, 0.5, 0.4, "%.0f");
            ImPlot::EndPlot();
        }
    }

    if (ImGui::BeginTable("mem table", 3, ImGuiTableFlags_RowBg | ImGuiTableFlags_SizingStretchSame))
    {
        ImGui::TableSetupColumn("");
        ImGui::TableSetupColumn("Reads");
        ImGui::TableSetupColumn("Writes");
        ImGui::TableHeadersRow();
        auto row = [](const char *name, uint64_t a, uint64_t b) {
            ImGui::TableNextRow();
            ImGui::TableNextColumn(); ImGui::TextUnformatted(name);
            ImGui::TableNextColumn(); ImGui::Text("%llu", (unsigned long long)a);
            ImGui::TableNextColumn(); ImGui::Text("%llu", (unsigned long long)b);
        };
        row("Guest accesses", rd, wr);
        row("  RAM", rd - mmio_rd, wr - mmio_wr);
        row("  MMIO", mmio_rd, mmio_wr);
        ImGui::TableNextRow();
        ImGui::TableNextColumn(); ImGui::TextUnformatted("Bytes moved");
        ImGui::TableNextColumn(); ImGui::Text("%s", si((double)rdb, "B"));
        ImGui::TableNextColumn(); ImGui::Text("%s", si((double)wrb, "B"));
        ImGui::EndTable();
    }
    ImGui::Text("Instruction fetches: %llu   Page-table reads: %llu", (unsigned long long)p.totalInsns(),
                (unsigned long long)t.ptw_reads);
    ImGui::TextDisabled("Fetches and page-table reads are counted separately from guest loads/stores.");
}

static void tabMmuTraps(const Profiler &p, const ProfCounters &t)
{
    uint64_t walks = t.mmu_walks[0] + t.mmu_walks[1] + t.mmu_walks[2];
    if (walks == 0)
        ImGui::TextDisabled("No page-table walks yet: translation is off (Bare) or the hart is in M-mode.");
    linePlot(p, "MMU activity", "/s", {{"walks", &p.walk_rate}, {"PTE reads", &p.ptw_rate}, {"page faults", &p.fault_rate}}, 170);
    ImGui::Text("Walks  fetch: %llu   load: %llu   store: %llu      Page faults  fetch: %llu   load: %llu   store: %llu",
                (unsigned long long)t.mmu_walks[0], (unsigned long long)t.mmu_walks[1], (unsigned long long)t.mmu_walks[2],
                (unsigned long long)t.mmu_faults[0], (unsigned long long)t.mmu_faults[1], (unsigned long long)t.mmu_faults[2]);
    if (walks)
        ImGui::Text("PTE reads per walk: %.2f", (double)t.ptw_reads / (double)walks);

    linePlot(p, "Traps and interrupts", "/s", {{"exceptions", &p.trap_rate}, {"interrupts", &p.irq_rate}}, 150);

    // only the causes that actually occurred
    static double v[16];
    static const char *labels[16];
    int n = 0;
    for (int c = 0; c < 16; c++)
        if (t.traps[c]) { v[n] = (double)t.traps[c]; labels[n++] = prof_exception_name(c); }
    if (n) hbars("Exceptions by cause", labels, v, n, 40.0f + 26.0f * n);
    else   noData("No exceptions taken.");

    n = 0;
    for (int c = 0; c < 16; c++)
        if (t.irqs[c]) { v[n] = (double)t.irqs[c]; labels[n++] = prof_interrupt_name(c); }
    if (n) hbars("Interrupts taken", labels, v, n, 40.0f + 26.0f * n);
    else   noData("No interrupts taken.");

    ImGui::Text("Store-conditional: %llu succeeded, %llu failed", (unsigned long long)t.sc_ok, (unsigned long long)t.sc_fail);
}

static void tabDevices(const Profiler &p, const ProfCounters &t)
{
    linePlot(p, "UART", "B/s", {{"TX bytes", &p.uart_tx_rate}, {"RX bytes", &p.uart_rx_rate}}, 150);
    linePlot(p, "virtio-net", "frames/s", {{"TX", &p.vnet_tx_rate}, {"RX", &p.vnet_rx_rate}}, 150);
    if (ImGui::BeginTable("dev table", 2, ImGuiTableFlags_RowBg | ImGuiTableFlags_SizingStretchSame))
    {
        auto row = [](const char *name, uint64_t v) {
            ImGui::TableNextRow();
            ImGui::TableNextColumn(); ImGui::TextUnformatted(name);
            ImGui::TableNextColumn(); ImGui::Text("%llu", (unsigned long long)v);
        };
        row("UART bytes transmitted", t.uart_tx_bytes);
        row("UART bytes received", t.uart_rx_bytes);
        row("Host stdin polls", t.stdin_polls);
        row("virtio-net RX servicing passes", t.vnet_ticks);
        row("virtio-net frames sent", p.vcur.tx_frames - p.vbase.tx_frames);
        row("virtio-net frames received", p.vcur.rx_frames - p.vbase.rx_frames);
        row("virtio-net bytes sent", p.vcur.tx_bytes - p.vbase.tx_bytes);
        row("virtio-net bytes received", p.vcur.rx_bytes - p.vbase.rx_bytes);
        ImGui::EndTable();
    }
}

static void tabHostTime(const Profiler &p, const ProfCounters &t)
{
    if (!p.sampling)
        ImGui::TextDisabled("Sampling is off.");
    if (t.samples == 0)
    {
        ImGui::TextDisabled("No samples yet: run the emulator.");
        return;
    }
    double st[PSTAGE_COUNT], total = 0;
    for (int i = 0; i < PSTAGE_COUNT; i++)
    {
        st[i] = std::max(0.0, (double)t.stage_ns[i] - (double)t.timer_ns) / (double)t.samples;
        total += st[i];
    }
    ImGui::Text("Sampled %llu instructions (1 in %u).  Estimated emulate() cost: %.1f ns/instruction (~%.1f MIPS in the core loop).",
                (unsigned long long)t.samples, (unsigned)PROF_SAMPLE_PERIOD, total, total > 0 ? 1000.0 / total : 0.0);
    ImGui::TextDisabled("Timer-call overhead (%.0f ns, measured per sample) is subtracted from every stage. Stages cost less than the\n"
                        "timer tick, so read the shares as estimates; they converge as samples accumulate.",
                        (double)t.timer_ns / (double)t.samples);

    // one stacked horizontal bar of ns/instruction per stage
    {
        static double v[PSTAGE_COUNT];
        static const char *labels[PSTAGE_COUNT];
        for (int i = 0; i < PSTAGE_COUNT; i++) { v[i] = st[i]; labels[i] = prof_stage_name(i); }
        hbars("ns per instruction by stage", labels, v, PSTAGE_COUNT, 190);
    }

    if (ImPlot::BeginPlot("Share of emulate() time", ImVec2(-1, 200)))
    {
        ImPlot::SetupAxes("t (s)", "%", ImPlotAxisFlags_None, ImPlotAxisFlags_AutoFit);
        ImPlot::SetupAxisLimits(ImAxis_Y1, 0, 100, ImPlotCond_Once);
        if (!p.paused)
            ImPlot::SetupAxisLimits(ImAxis_X1, p.t_now - p.history_s, p.t_now, ImPlotCond_Always);
        ImPlot::SetupLegend(ImPlotLocation_NorthWest, ImPlotLegendFlags_Horizontal | ImPlotLegendFlags_Outside);
        for (int i = 0; i < PSTAGE_COUNT; i++)
        {
            const ProfSeries &s = p.stage_pct[i];
            if (s.count)
                ImPlot::PlotLine(prof_stage_name(i), s.x.data(), s.y.data(), s.count, ImPlotLineFlags_None, s.offset());
        }
        ImPlot::EndPlot();
    }
    linePlot(p, "Sampled cost per instruction", "ns", {{"ns / instruction", &p.ns_per_insn}}, 130);

    if (ImGui::BeginTable("stage table", 3, ImGuiTableFlags_RowBg | ImGuiTableFlags_SizingStretchSame))
    {
        ImGui::TableSetupColumn("Stage");
        ImGui::TableSetupColumn("ns / instruction");
        ImGui::TableSetupColumn("Share");
        ImGui::TableHeadersRow();
        for (int i = 0; i < PSTAGE_COUNT; i++)
        {
            ImGui::TableNextRow();
            ImGui::TableNextColumn(); ImGui::TextUnformatted(prof_stage_name(i));
            ImGui::TableNextColumn(); ImGui::Text("%.2f", st[i]);
            ImGui::TableNextColumn(); ImGui::Text("%.1f %%", total > 0 ? 100.0 * st[i] / total : 0.0);
        }
        ImGui::EndTable();
    }

    ImGui::SeparatorText("Privilege mode (sampled)");
    {
        static const char *names[4] = {"User", "Supervisor", "-", "Machine"};
        static double v[3];
        static const char *labels[3] = {"User", "Supervisor", "Machine"};
        v[0] = (double)t.priv_samples[0]; v[1] = (double)t.priv_samples[1]; v[2] = (double)t.priv_samples[3];
        (void)names;
        hbars("Instructions by privilege", labels, v, 3, 120);
        ImGui::Text("U %.1f %%   S %.1f %%   M %.1f %%", pct(t.priv_samples[0], t.samples),
                    pct(t.priv_samples[1], t.samples), pct(t.priv_samples[3], t.samples));
    }
}

static void tabHotspots(const Profiler &p)
{
    if (p.hot_pcs.empty())
    {
        ImGui::TextDisabled("No samples yet: run the emulator.");
        return;
    }
    ImGui::Text("Sampled PCs: %llu (1 in %u), %llu distinct%s", (unsigned long long)p.hotTotal(), (unsigned)PROF_SAMPLE_PERIOD,
                (unsigned long long)p.hotDistinct(), p.hotDropped() ? "  [table full: some PCs not recorded]" : "");
    if (!p.hasSymbols())
        ImGui::TextDisabled("No symbols: load an ELF (Memory Loader or -e) to see function names; raw images show addresses only.");

    const uint64_t total = p.hotTotal();
    if (p.hasSymbols() && !p.hot_funcs.empty())
    {
        ImGui::SeparatorText("Top functions");
        static double v[16];
        static const char *labels[16];
        int n = 0;
        for (const auto &f : p.hot_funcs)
            if (n < 16) { v[n] = (double)f.n; labels[n++] = f.name.c_str(); }
        hbars("Top functions", labels, v, n, 50.0f + 22.0f * n);
    }

    ImGui::SeparatorText("Top program counters");
    if (ImGui::BeginTable("hot pcs", 4, ImGuiTableFlags_RowBg | ImGuiTableFlags_SizingStretchProp))
    {
        ImGui::TableSetupColumn("PC");
        ImGui::TableSetupColumn("Symbol");
        ImGui::TableSetupColumn("Samples");
        ImGui::TableSetupColumn("Share");
        ImGui::TableHeadersRow();
        for (const auto &h : p.hot_pcs)
        {
            ImGui::TableNextRow();
            ImGui::TableNextColumn(); ImGui::Text("0x%llx", (unsigned long long)h.pc);
            ImGui::TableNextColumn(); ImGui::TextUnformatted(h.sym.empty() ? "-" : h.sym.c_str());
            ImGui::TableNextColumn(); ImGui::Text("%llu", (unsigned long long)h.n);
            ImGui::TableNextColumn(); ImGui::Text("%.2f %%", pct(h.n, total));
        }
        ImGui::EndTable();
    }

    ImGui::SeparatorText("Hot 4 KiB pages");
    {
        static double v[12];
        static const char *labels[12];
        int n = 0;
        for (const auto &pg : p.hot_pages)
            if (n < 12) { v[n] = (double)pg.n; labels[n++] = pg.label.c_str(); }
        hbars("Hot pages", labels, v, n, 50.0f + 22.0f * n);
    }

    ImGui::SeparatorText("Address-space heat map");
    if (!p.heat.empty())
    {
        ImGui::TextDisabled("0x%llx .. 0x%llx, %llu KiB per cell (sqrt scale)", (unsigned long long)p.heat_lo,
                            (unsigned long long)(p.heat_lo + p.heat_bucket * p.heat.size()),
                            (unsigned long long)(p.heat_bucket >> 10));
        ImPlot::PushColormap(ImPlotColormap_Hot);
        if (ImPlot::BeginPlot("##heat", ImVec2(-1, 160), ImPlotFlags_NoLegend | ImPlotFlags_NoMouseText))
        {
            ImPlot::SetupAxes(nullptr, nullptr, ImPlotAxisFlags_NoDecorations, ImPlotAxisFlags_NoDecorations);
            ImPlot::SetupAxesLimits(0, 1, 0, 1, ImPlotCond_Always);
            ImPlot::PlotHeatmap("heat", p.heat.data(), p.heat_rows, p.heat_cols, 0, 0, nullptr, ImPlotPoint(0, 0), ImPlotPoint(1, 1));
            if (ImPlot::IsPlotHovered())
            {
                ImPlotPoint m = ImPlot::GetPlotMousePos();
                int col = (int)(m.x * p.heat_cols), row = (int)((1.0 - m.y) * p.heat_rows);
                if (col >= 0 && col < p.heat_cols && row >= 0 && row < p.heat_rows)
                {
                    uint64_t a = p.heat_lo + (uint64_t)(row * p.heat_cols + col) * p.heat_bucket;
                    ImGui::SetTooltip("0x%llx .. 0x%llx", (unsigned long long)a, (unsigned long long)(a + p.heat_bucket));
                }
            }
            ImPlot::EndPlot();
        }
        ImPlot::PopColormap();
    }
}

// ---- window body ---------------------------------------------------------------------------------

void Profiler::draw()
{
    ImGui::Checkbox("Pause", &paused);
    ImGui::SameLine();
    if (ImGui::Button("Reset totals"))
        reset();
    ImGui::SameLine();
    ImGui::SetNextItemWidth(110);
    ImGui::SliderInt("Sample (ms)", &interval_ms, 50, 1000);
    ImGui::SameLine();
    ImGui::SetNextItemWidth(110);
    ImGui::SliderInt("History (s)", &history_s, 5, 120);
    ImGui::SameLine();
    ImGui::Checkbox("Host-time sampling", &sampling);
    if (ImGui::Button("Export CSV"))
    {
        char name[64];
        time_t now = time(nullptr);
        strftime(name, sizeof name, "rve-profile-%Y%m%d-%H%M%S.csv", localtime(&now));
        export_status = exportCsv(name) ? std::string("wrote ") + name : std::string("could not write ") + name;
    }
    if (!export_status.empty())
    {
        ImGui::SameLine();
        ImGui::TextDisabled("%s", export_status.c_str());
    }
    ImGui::Separator();

    const ProfCounters t = tot();
    if (ImGui::BeginTabBar("profiler tabs"))
    {
        if (ImGui::BeginTabItem("Overview"))     { tabOverview(*this, t);     ImGui::EndTabItem(); }
        if (ImGui::BeginTabItem("Instructions")) { tabInstructions(*this, t); ImGui::EndTabItem(); }
        if (ImGui::BeginTabItem("Memory"))       { tabMemory(*this, t);       ImGui::EndTabItem(); }
        if (ImGui::BeginTabItem("MMU & Traps"))  { tabMmuTraps(*this, t);     ImGui::EndTabItem(); }
        if (ImGui::BeginTabItem("Devices"))      { tabDevices(*this, t);      ImGui::EndTabItem(); }
        if (ImGui::BeginTabItem("Host time"))    { tabHostTime(*this, t);     ImGui::EndTabItem(); }
        if (ImGui::BeginTabItem("Hotspots"))     { tabHotspots(*this);        ImGui::EndTabItem(); }
        ImGui::EndTabBar();
    }
}

#endif // RVE_PROFILE
