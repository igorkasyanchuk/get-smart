## ⚡ Instrument Custom Events with ActiveSupport::Notifications

ActiveSupport::Notifications lets you profile, log, or react to any custom event in your Rails application. You can instrument code blocks with arbitrary names and payloads, then subscribe to specific patterns using regex or exact names. This is great for monitoring performance hotspots without tightly coupling to your business logic.

```ruby
# Instrument a custom event with a payload
ActiveSupport::Notifications.instrument('order.process', order_id: order.id) do
  order.process!
end

# Subscribe to all "order.*" events and log durations
ActiveSupport::Notifications.subscribe(/order\./) do |name, start, finish, id, payload|
  duration = (finish - start) * 1000
  Rails.logger.info "#{name} for order ##{payload[:order_id]} took #{duration.round(2)}ms"
end
```
