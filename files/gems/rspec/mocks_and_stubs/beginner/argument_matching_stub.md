## 🎯 Use Argument Matchers in Stubs and Mocks

Argument matchers like `anything`, `kind_of`, or `hash_including` let you flexibly specify which calls to stub or expect, without hardcoding exact values. This makes your tests less brittle and more readable.

```ruby
notifier = double('Notifier')
allow(notifier).to receive(:notify).with(kind_of(String), hash_including(id: 1))

RSpec.describe Order do
  it 'sends notification with order data' do
    order = Order.new(id: 1)
    order.notifier = notifier

    order.complete

    expect(notifier).to have_received(:notify).once
  end
end
```