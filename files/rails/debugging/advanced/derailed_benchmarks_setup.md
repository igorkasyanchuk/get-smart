## 🚂 Benchmark Memory & CPU with derailed_benchmarks
Use `derailed_benchmarks` to profile your entire Rails boot process, identify gem bloat, and track object allocations. This is crucial for optimizing boot times and reducing memory footprint in containerized setups.

```bash
# install the gem
gem install derailed_benchmarks

# measure boot memory
derailed bundle:mem

# measure boot speed
derailed exec perf:objects
```

Analyze the output to trim unused gems or refactor large initializers.