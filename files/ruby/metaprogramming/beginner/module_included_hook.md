## 🧩 Use `included` Hook in Modules

When a module is included in a class, the `included` method is called. You can use it to extend class methods or set up callbacks automatically.

```ruby
module Trackable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def track
      puts "Tracking #{name}"
    end
  end
end

class Order
  include Trackable
end

Order.track   # => "Tracking Order"
```