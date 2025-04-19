## 🧪 Testing Callbacks Precisely with RSpec
Avoid coupling tests to implementation details. Use RSpec spies and stub only external dependencies in callbacks. Test that callbacks fire under correct conditions rather than asserting internal state changes directly.

```ruby
RSpec.describe Payment, type: :model do
  describe 'after_commit :notify_gateway' do
    it 'enqueues a notification job after successful save' do
      payment = build(:payment)
      expect {
        payment.save
      }.to have_enqueued_job(GatewayNotificationJob).with(payment.id)
    end
  end
end
```

By focusing on side effects (e.g., enqueued jobs), you keep your tests resilient to refactoring and internal changes.