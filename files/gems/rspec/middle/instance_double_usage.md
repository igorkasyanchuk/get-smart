## 📦 Instance Doubles

Use `instance_double` to create strict test doubles that only allow methods defined on the real class. This ensures your stubs match the public API.

```ruby
class Notifier
  def notify(user); end
end

RSpec.describe OrderProcessor do
  let(:notifier) { instance_double(Notifier) }

  before do
    allow(notifier).to receive(:notify)
  end

  it "sends a notification after processing" do
    subject = OrderProcessor.new(notifier: notifier)
    subject.process(order)
    expect(notifier).to have_received(:notify).with(order.user)
  end
end
```
