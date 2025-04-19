## ⏱️ Measuring Pure Ruby with Benchmark.realtime

If you only care about the elapsed (“real”) time as a float, use `Benchmark.realtime`. It omits user and system times for a quick numeric result, perfect for embedding in scripts or assertions.

```ruby
require 'benchmark'

elapsed = Benchmark.realtime do
  sleep 0.5  # replace with your logic
end

puts "Elapsed time: #{elapsed.round(3)} seconds"
```