## 🎯 On‑The‑Fly Production Sampling with rbspy

For zero‑instrumentation profiling in production, use rbspy to attach to a running Ruby process, sample stack traces at a configurable rate, and generate flamegraphs without downtime. This method is safe under load and doesn’t require code changes.

```bash
# Install rbspy
cargo install rbspy

# Run against a live PID
sudo rbspy record --pid $PID --output profile.rbspy

# Convert to flamegraph.svg
rbspy flamegraph --input profile.rbspy --output flamegraph.svg
open flamegraph.svg
```