## 🕒 Using Benchmark.measure for Quick Timing

`Benchmark.measure` is the simplest way to time a block of code. It returns a `Benchmark::Tms` object that reports real, user, and system time. Use it when you want a quick glance at how long a snippet takes to run.

```ruby
require 'benchmark'

time = Benchmark.measure do
  # your code here
  100_000.times { |i| i * 2 }
end

puts time  # =>   0.010000   0.000000   0.010000 (  0.009876)
```