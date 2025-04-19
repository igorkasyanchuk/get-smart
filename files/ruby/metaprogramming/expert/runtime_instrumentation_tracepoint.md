## 🕵️ Runtime Instrumentation with TracePoint

Leverage the `TracePoint` API to hook into Ruby’s execution engine for profiling, debugging, or live code analysis. This low-level facility can capture calls, returns, class definitions, and more with minimal intrusion.

```ruby
tracer = TracePoint.new(:call, :return) do |tp|
  if tp.defined_class == MyService && tp.event == :call
    puts "Calling #{tp.method_id} at line #{tp.lineno}"
  elsif tp.event == :return
    puts "Returned from #{tp.method_id}"
  end
end

class MyService
  def process; sleep(0.05); end
end

tracer.enable
MyService.new.process
tracer.disable
```