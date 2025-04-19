## ⏱️ Use Benchmark.measure for Quick Timing

Use Ruby's built-in `Benchmark.measure` to wrap any block of code and get a detailed breakdown of times (user CPU, system CPU, total CPU, and real elapsed time). It's perfect for quick one-off measurements in scripts or during development.

```ruby
require 'benchmark'

time = Benchmark.measure do
  User.all.to_a
end

puts time
# =>   user     system      total        real
# =>  0.010000   0.000000   0.010000 (  0.012345)
```
