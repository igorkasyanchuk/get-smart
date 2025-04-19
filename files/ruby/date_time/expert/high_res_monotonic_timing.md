## 🕰️ High-Resolution Monotonic Timing

When profiling or benchmarking critical code paths, relying on `Time.now` can introduce errors due to NTP adjustments or clock drift. Instead, use the OS’s monotonic clock via `Process.clock_gettime(Process::CLOCK_MONOTONIC)` for nanosecond precision and immunity to system time changes.

Example: benchmarking a database call:

```ruby
start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# ... expensive operation ...
result = MyDatabase.query("SELECT * FROM users")
finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
elapsed_ns = ((finish - start) * 1_000_000_000).to_i
puts "Query took #{elapsed_ns} ns"
```

You can wrap this in a helper to automatically handle conversion to ms or µs without polluting global scope.