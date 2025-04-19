## 🐙 Use `before` Hooks to DRY Setup

`before` hooks run setup code before each example, letting you avoid duplication across multiple tests. This is ideal for initializing objects or stubbing dependencies that all examples share.

```ruby
RSpec.describe Order do
  before(:each) do
    @order = Order.new(price: 100)
  end

  it 'has the correct price' do
    expect(@order.price).to eq(100)
  end

  it 'is not shipped by default' do
    expect(@order.shipped?).to be_falsey
  end
end
```
