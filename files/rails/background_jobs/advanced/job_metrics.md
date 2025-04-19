## 📊 Instrumenting Jobs with ActiveSupport::Notifications

Track job durations and failures by subscribing to the `perform.active_job` event. Push metrics to your preferred monitoring system for real‑time insights.

```ruby
# config/initializers/job_metrics.rb
ActiveSupport::Notifications.subscribe('perform.active_job') do |name, start, finish, id, payload|
  duration_ms = (finish - start) * 1000
  status = payload[:exception] ? 'error' : 'success'
  StatsD.increment("jobs.#{payload[:job].class.name}.#{status}")
  StatsD.timing("jobs.#{payload[:job].class.name}.duration", duration_ms)
end
```

Each job invocation emits metrics like `jobs.ProcessOrderJob.success` and timing data, empowering performance tuning.