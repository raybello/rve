#!/usr/bin/env node
// End-to-end network test: boots the rv64 Linux image headless with the userspace network stack
// wired to the deterministic FakeHost (-F) and drives the guest shell over stdin/stdout.
//   node scripts/net_e2e.mjs [path/to/rve64] [path/to/Image]
// Everything is local and offline: "*.test" names resolve to 93.184.216.34 and HTTP requests get
// a canned 200 body, so the assertions are exact.
import { spawn } from 'node:child_process';

const bin = process.argv[2] ?? 'rve/build64/rve64';
const image = process.argv[3] ?? 'rve/assets/linux64/Image';
const child = spawn(bin, ['-n', '-F', '-b', image], { stdio: ['pipe', 'pipe', 'inherit'] });

let buf = '';
let waiter = null;
child.stdout.on('data', (d) => {
  const s = d.toString();
  process.stdout.write(s);
  buf += s;
  if (waiter && waiter.re.test(buf)) { const w = waiter; waiter = null; clearTimeout(w.timer); w.resolve(buf); }
});
child.on('exit', (code) => { if (waiter) waiter.reject(new Error(`emulator exited (${code}) while waiting for ${waiter.re}`)); });

function waitFor(re, ms) {
  return new Promise((resolve, reject) => {
    if (re.test(buf)) return resolve(buf);
    const timer = setTimeout(() => { waiter = null; reject(new Error(`timeout waiting for ${re}\n--- output tail ---\n${buf.slice(-800)}`)); }, ms);
    waiter = { re, resolve, reject, timer };
  });
}

let n = 0;
async function sh(cmd, ms = 30000) {
  const tag = `__END${++n}__`;
  buf = '';
  child.stdin.write(`${cmd}; echo ${tag}\n`);
  await waitFor(new RegExp(`^${tag}`, 'm'), ms);
  return buf.split(tag)[0].replace(/\r/g, '');
}

let failed = 0;
function expect(name, out, re) {
  const ok = re.test(out);
  console.log(`\n${ok ? 'PASS' : 'FAIL'}  ${name}`);
  if (!ok) { failed++; console.log(`  expected ${re}\n  got: ${out.trim().slice(-400)}`); }
}

try {
  await waitFor(/Welcome to RVE Linux/, 120000);
  await new Promise((r) => setTimeout(r, 1500));
  let out = '';
  for (let i = 0; i < 20 && !/10\.0\.2\.15/.test(out); i++) {   // DHCP runs in the background at boot
    out = await sh('ip addr show eth0');
    if (!/10\.0\.2\.15/.test(out)) await new Promise((r) => setTimeout(r, 1000));
  }
  expect('eth0 got a DHCP lease (10.0.2.15)', out, /inet 10\.0\.2\.15\/24/);
  expect('default route via gateway', await sh('ip route'), /default via 10\.0\.2\.2/);
  expect('DNS: foo.test resolves', await sh('nslookup foo.test 10.0.2.3'), /93\.184\.216\.34/);
  expect('DNS: unknown name fails', await sh('nslookup nx.example 10.0.2.3 2>&1'), /NXDOMAIN|can't resolve|not found|No answer/i);
  expect('ping resolved host', await sh('ping -c 2 -W 3 foo.test 2>&1'), /2 packets received|0% packet loss/);
  expect('ping unresolved host is unreachable', await sh('ping -c 1 -W 2 8.8.8.8 2>&1'), /unreachable|100% packet loss/i);
  expect('HTTP GET bridged to host', await sh('wget -qO- http://foo.test/hello 2>&1'), /fake host: GET https:\/\/foo\.test\/hello/);
  expect('TCP to an unsupported port is refused', await sh('nc -w 3 93.184.216.34 22 </dev/null 2>&1; echo rc=$?'), /refused|rc=[1-9]/i);
} catch (e) {
  failed++;
  console.error(`\nERROR: ${e.message}`);
}
child.kill();
console.log(failed ? `\nnet_e2e: ${failed} failure(s)` : '\nnet_e2e: all passed');
process.exit(failed ? 1 : 0);
