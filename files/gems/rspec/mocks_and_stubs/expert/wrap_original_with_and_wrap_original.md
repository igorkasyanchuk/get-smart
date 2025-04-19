## 🕸️ Wrapping Original Implementation with `and_wrap_original`

Use `and_wrap_original` to intercept a real method, perform side‑effects or logging, and then delegate to the original implementation. This technique is invaluable for non‑intrusive instrumentation or measuring performance without rewriting the method under test.

```ruby
class Notifier
  def notify(user, message)
    # complex external service call
  end
end

RSpec.describe Notifier do
  it 'logs before delegation via and_wrap_original' do
    allow_any_instance_of(Notifier)
      .to receive(:notify)
      .and_wrap_original do |original, user, msg|
        Rails.logger.info("Notifying User##{user.id} with '#{msg}'")
        original.call(user, msg)
      end

    user = double(:user, id: 42)
    notifier = Notifier.new
    notifier.notify(user, 'Hello')

    expect(Rails.logger).to have_received(:info)
      .with("Notifying User#42 with 'Hello'")
  end
end
```
