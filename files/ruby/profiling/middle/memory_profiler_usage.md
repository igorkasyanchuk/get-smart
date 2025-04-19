## 🧠 Detecting Memory Leaks with memory_profiler
The `memory_profiler` gem tracks live objects, memory retained, and allocation points. Wrap the code under test in `MemoryProfiler.report` to get a snapshot. Use `pretty_print` or JSON format to integrate into CI or further analysis.

```ruby
require 'memory_profiler'

report = MemoryProfiler.report do
  User.import(csv_path)
end

report.pretty_print(to_file: 'tmp/memory_report.txt')
```