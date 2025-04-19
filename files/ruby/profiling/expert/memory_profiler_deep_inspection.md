## 🧐 In‑Depth Memory Profiling with MemoryProfiler Gem

Use the MemoryProfiler gem to capture allocation counts, retained memory, and call stacks for allocations. This technique helps you pinpoint memory leaks and large object churn in long‑running processes.

```ruby
# Gemfile: gem 'memory_profiler'
require 'memory_profiler'

report = MemoryProfiler.report do
  # Code path to analyze
  parser = MyComplexParser.new
  10_000.times { parser.parse(sample_input) }
end

report.pretty_print(to_file: 'memory_report.txt')
```