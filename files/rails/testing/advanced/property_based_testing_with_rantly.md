## 🎲 Property‑Based Testing with Rantly
Use the `rantly` and `rantly-rspec` gems to generate randomized inputs and verify invariants across a wide range of cases, catching edge conditions you might miss with example‑based specs.

```ruby
# Gemfile:
gem 'rantly'
gem 'rantly-rspec'

# spec/models/order_spec.rb
require 'rantly/rspec_extensions'

RSpec.describe Order, type: :model do
  property_of { array(size: 10) { integer(0, 100) } }.check { |prices|
    order = Order.new(prices: prices)
    expect(order.total).to eq(prices.sum)
  }
end
```