## 📊 Real-Time Profiling with TracePoint

Employ `TracePoint` to hook into runtime events (call, return, class) for on-the-fly performance monitoring or debugging of object-oriented flows without restarting the process.

```ruby
trace = TracePoint.new(:call, :return) do |tp|
  if tp.defined_class == UserService && tp.method_id == :authenticate
    puts "#{tp.event} #{tp.defined_class}##{tp.method_id} at line #{tp.lineno}"
  end
end

trace.enable
UserService.new.authenticate('user', 'pwd')
trace.disable
```