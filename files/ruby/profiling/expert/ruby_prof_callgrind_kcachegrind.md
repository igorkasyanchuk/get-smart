## 🐢 Profiling with Callgrind Output and KCachegrind

For deep call-stack analysis, use ruby‑prof’s CallTreePrinter to emit Callgrind‑compatible data and inspect hot paths in KCachegrind. This lets you drill into inclusive vs. exclusive times and visualize call hierarchies graphically.

```ruby
require 'ruby-prof'

RubyProf.measure_mode = RubyProf::WALL_TIME
result = RubyProf.profile do
  # Your complex workload here
  10_000.times { Math.sqrt(rand) }
end

File.open("callgrind.out.#{Process.pid}", 'w') do |f|
  RubyProf::CallTreePrinter.new(result).print(f)
end
```

Then run:
```bash
kcachegrind callgrind.out.$PID
```