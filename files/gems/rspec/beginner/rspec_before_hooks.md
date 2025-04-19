## 🔧 before Hooks for Setup

Use `before` hooks to DRY up repetitive setup code that runs before each example. Choose `:each` for individual tests or `:all` for once per group.

```ruby
RSpec.describe Order do
  before(:each) do
    @order = Order.new
  end

  it 'is invalid without items' do
    expect(@order.valid?).to be_falsey
  end
end
```
