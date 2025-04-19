## 🍨 Verifying Module Methods with `class_double`

Ensure your stubs match the real module API by using `class_double` with `:as_stubbed_const`. This guards against API drift when an external module changes its interface. If you stub a non‑existent method, RSpec will raise an error immediately.

```ruby
module PaymentGateway
  def self.process(amount)
    # external HTTP call
  end
end

class Order
  def checkout
    PaymentGateway.process(total)
  end

  def total
    100
  end
end

RSpec.describe Order do
  it 'uses the payment gateway with verifying double' do
    stub_gateway = class_double("PaymentGateway", process: "success").as_stubbed_const
    order = Order.new

    expect(order.checkout).to eq("success")
  end
end
```
