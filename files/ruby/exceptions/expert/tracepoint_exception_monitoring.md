## 🔍 TracePoint-Based Exception Instrumentation

Leverage `TracePoint` to globally hook into exception raises and implement custom logging, metrics, or alerts without littering `rescue` blocks throughout your application.

```ruby
trace = TracePoint.new(:raise) do |tp|
  exception  = tp.raised_exception
  location   = "#{tp.path}:#{tp.lineno}"
  metric_name = "exceptions.raised.#{exception.class.name.downcase}"

  # Send to statsd or external monitoring
  StatsD.increment(metric_name)
  logger.error("Exception raised: #{exception.class} at #{location}\n#{exception.message}")
end

trace.enable

# Your application code... any exception will be captured by the TracePoint hook
```

Remember to disable the trace (`trace.disable`) in performance-critical sections.