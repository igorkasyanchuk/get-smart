## 🧬 Profile Memory Leaks with memory_profiler
The `memory_profiler` gem can snapshot heap allocations and identify retained objects, helping you locate memory bloat or leaks in controllers, models, or background jobs.

```ruby
# Gemfile
gem 'memory_profiler', group: :development

# in your task or console
report = MemoryProfiler.report do
  MyLongRunningService.new.run_heavy_process
end
report.pretty_print(to_file: 'tmp/memory_report.txt')
```