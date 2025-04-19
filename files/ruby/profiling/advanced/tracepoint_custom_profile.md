## 🕵️ Custom Event Profiling with TracePoint

When you need fine-grained insight beyond CPU timing—like tracking allocations or GC events—TracePoint allows hooking into Ruby’s VM events. You can build custom profilers that collect metrics on calls, returns, class definitions, or object allocations.

```ruby
trace = TracePoint.new(:call, :return, :allocations) do |tp|
  case tp.event
  when :call
    puts "Calling: #{tp.defined_class}##{tp.method_id} at #{tp.path}:#{tp.lineno}"
  when :allocations
    puts "Allocated: #{tp.self.class} at #{tp.path}:#{tp.lineno}"
  end
end

trace.enable
# Run the code segment you want to inspect
do_complex_task
trace.disable
```