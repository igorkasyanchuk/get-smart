## 📊 Leverage ActiveSupport::Notifications for Real-Time Metrics

When benchmarking in production‑like environments, subscribe to Rails instrumentation events to capture real user interactions. This approach gives you end‑to‑end timings without modifying controllers or cluttering business logic.

```ruby
# config/initializers/benchmark_notifications.rb
ActiveSupport::Notifications.subscribe('process_action.action_controller') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  payload = event.payload

  Rails.logger.info(
    "[BENCHMARK] #{payload[:controller]}##{payload[:action]} " +
    "Status: #{payload[:status]} " +
    "Time: #{event.duration.round(1)}ms"
  )
end
```