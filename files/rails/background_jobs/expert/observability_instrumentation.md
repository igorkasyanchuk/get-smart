## 📊 Advanced Observability via ActiveSupport::Notifications

Instrument background jobs for latency, success/failure rates, and custom metrics by subscribing to `perform.active_job` or Sidekiq server events. Push timings to Datadog, StatsD, or Prometheus for real‑time dashboards and alerting.

```ruby
# config/initializers/job_instrumentation.rb
ActiveSupport::Notifications.subscribe('perform.active_job') do |name, start, finish, id, payload|
  duration_ms = (finish - start) * 1000
  StatsD.timing("jobs.duration", duration_ms, tags: ["job:#{payload[:job]}"])
  StatsD.increment("jobs.completed", tags: ["status:#{payload[:exception] ? 'error' : 'ok'}"])
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Middleware::Server::Statsd, namespace: 'sidekiq'
  end
end
```
