## 🕵️‍♂️ Instrument Code with TracePoint
`TracePoint` provides hooks into Ruby’s execution engine, letting you trace line events, method calls, class definitions, and more. Use it to build profilers, debuggers, or runtime analyzers without external gems.

```ruby
trace = TracePoint.new(:call, :return) do |tp|
  puts "#{tp.event} -> #{tp.defined_class}##{tp.method_id} at #{tp.path}:#{tp.lineno}"
end

trace.enable
[1,2,3].map { |n| n * 2 }
trace.disable
```