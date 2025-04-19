## 🔍 Use Spies for Partial Mocks and Call Verification

Spies let you wrap real objects or doubles and selectively override behavior while still collecting call information. This is ideal for verifying side effects without fully stubbing implementation.

```ruby
class Notifier
  def send_alert(user)
    # complex logic...
    deliver(user)
  end

  def deliver(user)
    # external service call
  end
end

notifier = spy(Notifie­r.new)
allow(notifier).to receive(:deliver)
notifier.send_alert(user)

expect(notifier).to have_received(:deliver).with(user)
```
