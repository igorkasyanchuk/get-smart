## ⚡️ Measure Elapsed Time with Benchmark.realtime

Use `Benchmark.realtime` when you only care about the real elapsed time as a float (in seconds). This is easy to integrate into your code logic and conditionally branch on performance.

```ruby
require 'benchmark'

elapsed = Benchmark.realtime do
  User.find(1)
end

puts "Query took #{elapsed.round(4)} seconds"
# => Query took 0.0023 seconds
```
