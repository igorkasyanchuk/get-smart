## ⚙️ Build a Custom ActiveSupport::LogSubscriber for Domain Events
Create a `LogSubscriber` to hook into Rails or custom events and emit structured domain-level logs. This isolates logging concerns and allows you to filter by event name or log level.

```ruby
# app/log_subscribers/domain_log_subscriber.rb
class DomainLogSubscriber < ActiveSupport::LogSubscriber
  def order_created(event)
    data = event.payload.slice(:order_id, :user_id, :total)
    Rails.logger.info("order.created", data)
  end
end

DomainLogSubscriber.attach_to(:order)
```

```ruby
# anywhere in service object
ActiveSupport::Notifications.instrument('order_created.order', order_id: order.id, user_id: order.user.id, total: order.total)
```