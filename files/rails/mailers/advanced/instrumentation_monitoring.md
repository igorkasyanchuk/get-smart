## 📊 Instrumentation & Monitoring
Use `ActiveSupport::Notifications` to measure mail performance and track failures. Subscribe to the `deliver.action_mailer` event to push metrics to Datadog or Prometheus.

```ruby
# config/initializers/mailer_instrumentation.rb
ActiveSupport::Notifications.subscribe('deliver.action_mailer') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  Rails.logger.info "Mail delivered in #{event.duration.round(1)}ms to #{event.payload[:to]}"
  StatsD.increment('mailer.deliveries')
end
```