## 🎯 Mock Method Call Expectations

Mocks let you set expectations on how many times and with what arguments a method should be called. Use `expect` with `receive` to verify interactions and catch unintended behavior.

```ruby
RSpec.describe Cart do
  describe '#add_item' do
    it 'adds an item to the cart' do
      cart = Cart.new
      item = double('Item')

      expect(cart).to receive(:add).with(item).once

      cart.add_item(item)
    end
  end
end
```