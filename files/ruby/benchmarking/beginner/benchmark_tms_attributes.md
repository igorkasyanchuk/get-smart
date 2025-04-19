## 💾 Accessing Real, User, and System Time from Tms

The object returned by `Benchmark.measure` holds separate timings: `real`, `utime`, and `stime`. Extract these attributes if you need to programmatically compare or log individual metrics.

```ruby
require 'benchmark'

t = Benchmark.measure do
  10_000.times { Math.sqrt(123.456) }
end

puts "Real: #{t.real}"    # wall‑clock time
puts "User: #{t.utime}"   # CPU time spent in Ruby
puts "System: #{t.stime}" # CPU time spent in system calls
```