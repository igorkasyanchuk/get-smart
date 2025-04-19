## 🔔 Assert Business Events with ActiveSupport::Notifications

Test that your domain publishes exactly the events you expect by subscribing and collecting payloads. This is crucial for event-driven architectures and background workers.

```ruby
RSpec.describe OrderProcessor, type: :model do
  it 'emits payment.completed with correct payload' do
    events = []
    subscriber = ActiveSupport::Notifications.subscribe('payment.completed') do |*args|
      event = ActiveSupport::Notifications::Event.new(*args)
      events << event.payload
    end

    OrderProcessor.new(order).process_payment

    expect(events).to include(
      hash_including(order_id: order.id, total: order.total_amount)
    )
  ensure
    ActiveSupport::Notifications.unsubscribe(subscriber)
  end
end
```

You can also assert timing (duration) or nested instrumentation by inspecting `event.duration`.