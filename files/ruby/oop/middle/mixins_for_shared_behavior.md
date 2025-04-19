## 🎯 Use Modules for Shared Behavior

When you have methods shared across unrelated classes, extract them into a module and mix it in. This promotes DRY code and makes it easy to test shared behavior in isolation.

```ruby
module Trackable
  def track(event)
    puts "Tracking \\#{event} at \\#{Time.now}"
  end
end

class Order
  include Trackable
end

order = Order.new
order.track("order_placed")
```