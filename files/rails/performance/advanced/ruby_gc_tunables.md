## 🛠️ Ruby Garbage Collection Tuning

Tuning Ruby’s generational GC reduces pause times in high‑throughput apps. Use `GC::Profiler` to identify hotspots and configure environment variables like `RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR` or enable incremental GC.

```ruby
# config/initializers/gc_profiler.rb
GC::Profiler.enable
at_exit do
  result = GC::Profiler.report
  Rails.logger.info("GC PROFILER:\n#{result}")
end
```

```bash
# environment variables
export RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR=1.5
export RUBY_GC_MALLOC_LIMIT=500_000
export RUBY_GC_INCREMENTAL_START_ENABLED=1
```