## 🧵 Profiling Thread & Fiber CPU Contention via ThreadWallTimePrinter

RubyProf supports THREAD_WALL_TIME mode to attribute time spent in threads and fibers, revealing contention or GIL‑induced waits. Use ThreadFlatPrinter for a concise table of hot methods across threads.

```ruby
require 'ruby-prof'

RubyProf.measure_mode = RubyProf::THREAD_WALL_TIME
result = RubyProf.profile do
  threads = 5.times.map do
    Thread.new { heavy_workload }  # CPU‑bound tasks
  end
  threads.each(&:join)
end

printer = RubyProf::ThreadFlatPrinter.new(result)
printer.print(STDOUT, {})
```