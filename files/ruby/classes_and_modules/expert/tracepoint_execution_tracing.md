## 🕵️‍♂️ Instrumenting Classes with `TracePoint`
Use `TracePoint` to hook into Ruby’s interpreter events, tracing method calls, class definitions, or exceptions. This is invaluable for deep debugging, profiling, or implementing complex runtime checks.

```ruby
trace = TracePoint.new(:call, :return) do |tp|
  if tp.defined_class == SlowService
    puts "#{tp.event} #{tp.method_id} at #{tp.path}:#{tp.lineno}"
  end
end
trace.enable

SlowService.new.process
trace.disable
```

Be mindful of performance impact and scope your tracing to specific classes or events.