## ⏱️ Using Benchmark.realtime for Quick Inline Timings

When you need a fast, one-off timing without the table layout, `Benchmark.realtime` returns the elapsed time in seconds as a float. It's perfect for measuring small snippets inline or storing the duration in a variable. Combine it with custom output to integrate into scripts or logs.

```ruby
require 'benchmark'

start_time = Benchmark.realtime do
  sleep(2)
end
puts "Operation took #{start_time.round(3)}s"
```