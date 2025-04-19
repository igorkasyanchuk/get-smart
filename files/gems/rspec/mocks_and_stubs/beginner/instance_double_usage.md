## 🧩 Use `instance_double` for Verifying Real Interfaces

An `instance_double` creates a test double that only allows methods defined on the real class, preventing typos and ensuring your stubs match the actual API. Combine it with `allow` to stub methods safely.

```ruby
class PaymentGateway
  def charge(amount); end
end

RSpec.describe OrderProcessor do
  it 'charges the correct amount' do
    gateway = instance_double(PaymentGateway)
    allow(gateway).to receive(:charge).with(100).and_return('OK')

    processor = OrderProcessor.new(gateway)
    expect(processor.process(100)).to eq('OK')
  end
end
```