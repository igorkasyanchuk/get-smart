## 🕵️ Use spies for post-execution assertions

Instead of setting expectations before calling the code, use a spy to record interactions and assert on them afterwards. This approach keeps your setup cleaner and makes it easier to test conditional calls.

```ruby
RSpec.describe NotificationService do
  it 'notifies the user once' do
    notifier = spy('Notifier')
    service = NotificationService.new(notifier)

    service.process(user_id: 42)

    expect(notifier).to have_received(:notify).with(42).once
  end
end
```
