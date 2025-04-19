## 📊 Fine‑Grained Instrumentation with ActiveSupport::Notifications

Hook into `deliver.action_mailer` and its lifecycle events to gather metrics, custom logs, and traces. This lets you monitor deliver timings, error rates, and queue backpressure.

```ruby
# config/initializers/mailer_instrumentation.rb
ActiveSupport::Notifications.subscribe "deliver.action_mailer" do |name, start, finish, id, payload|
  duration = (finish - start) * 1000.0
  Rails.logger.info "[Mailer] Delivered #{payload[:mailer]}##{payload[:action]} in #{duration.round(2)}ms to #{payload[:to]}"
  StatsD.increment("mailer.delivered", tags: ["mailer:#{payload[:mailer]}", "action:#{payload[:action]}"])
  StatsD.timing("mailer.delivery_time", duration, tags: ["queue:#{payload[:headers]['X-Queue-Name']}"])
end
```

With this you can push fine‑grained metrics to Datadog, Prometheus, or any APM, enabling real‑time SLAs for email delivery.