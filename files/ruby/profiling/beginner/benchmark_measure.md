## 🏎️ Measure execution time with Benchmark.measure

Rubys built-in Benchmark module makes it easy to time small pieces of code. Use `Benchmark.measure` to wrap the code you want to profile and get a report of user, system, total, and real time.

```ruby
require 'benchmark'

result = Benchmark.measure do
  # Code to measure
  sleep(0.5)
end

puts result
#=>   0.000000   0.000000   0.000000 (  0.500123)
```