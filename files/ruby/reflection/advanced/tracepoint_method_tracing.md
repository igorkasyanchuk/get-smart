## 🔍 Trace and Profile Method Calls with TracePoint
You can hook into Ruby’s execution at a low level using `TracePoint`, enabling you to trace method calls, returns, and line events without modifying the target code. This is useful for profiling, logging, or debugging complex gems or applications.

```ruby
trace = TracePoint.new(:call, :return) do |tp|
  if tp.defined_class == MyService && tp.method_id == :perform
    if tp.event == :call
      puts "Calling MyService#perform at line #{tp.lineno}"
    else
      puts "Returned from MyService#perform with value: #{tp.return_value.inspect}"
    end
  end
end

trace.enable
MyService.new.perform
trace.disable
```