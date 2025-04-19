## 🔔 Use ActiveSupport::Notifications for Custom Instrumentation
Leverage `ActiveSupport::Notifications` to instrument and log custom events around service calls or controllers. This lets you capture runtime metrics and inspect payloads without polluting core code logic.

```ruby
# config/initializers/notifications.rb
ActiveSupport::Notifications.subscribe('process_order.checkout') do |name, start, finish, id, payload|
  duration = (finish - start) * 1000
  Rails.logger.debug "[Instrumentation] #{name} took #{duration.round(1)}ms for order_id=#{payload[:order_id]}"
end

# in service
ActiveSupport::Notifications.instrument('process_order.checkout', order_id: order.id) do
  checkout_cart(order)
end
```