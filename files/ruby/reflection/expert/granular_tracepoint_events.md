## 🕵️ TracePoint for Granular Runtime Event Tracing
TracePoint lets you hook into Ruby’s runtime and inspect or alter behavior at the bytecode level. You can track method calls, class definitions, and even garbage collection events, all with minimal overhead.

```ruby
# Trace all method calls within a specific class
trace = TracePoint.new(:call, :return) do |tp|
  if tp.defined_class == MyClass && tp.event == :call
    puts "Calling #{tp.method_id} with args=#{tp.parameters.inspect}"
  end
end
trace.enable
MyClass.new.foo(1, 2)
trace.disable
```

Combine multiple event types (e.g., :class, :line) and inspect `tp.binding` to dynamically inject logic or analyze local variables at precise execution points.