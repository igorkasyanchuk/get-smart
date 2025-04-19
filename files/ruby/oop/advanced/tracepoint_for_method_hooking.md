## 🏗️ Instrument Code with `TracePoint` Hooks
Use `TracePoint` to hook into runtime events (method calls, class definitions, etc.) for advanced instrumentation, profiling, or custom logging.

```ruby
trace = TracePoint.new(:call) do |tp|
  puts "Called [34m#{tp.defined_class}##{tp.method_id}[0m"
end

trace.enable

class Sample
  def greet; puts 'Hi'; end
end

Sample.new.greet
trace.disable
```