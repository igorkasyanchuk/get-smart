## 🔍 Trace Method Calls with Ruby TracePoint
`TracePoint` lets you hook into Ruby's interpreter events (call, return, line) to log or inspect method execution without modifying application code. Ideal for dynamically tracing complex Gems or Rails internals.

```ruby
trace = TracePoint.new(:call, :return) do |tp|
  if tp.defined_class.to_s.match?(/^ActiveRecord::/)
    Rails.logger.debug "#{tp.event} #{tp.defined_class}##{tp.method_id} at #{tp.path}:#{tp.lineno}"
  end
end

# Start tracing
trace.enable
# …exercise your Rails code paths
trace.disable
```