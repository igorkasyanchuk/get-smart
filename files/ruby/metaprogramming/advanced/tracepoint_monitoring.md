## 🔍 Runtime inspection with `TracePoint`
Leverage `TracePoint` to hook into Ruby internals (calls, returns, line execution) for profiling or live instrumentation. This low‑level API provides granular control over event handling.

```ruby
trace = TracePoint.new(:call) do |tp|
  puts "Calling #{tp.method_id} in #{tp.defined_class}"
end

trace.enable
SomeClass.new.some_method
trace.disable
```