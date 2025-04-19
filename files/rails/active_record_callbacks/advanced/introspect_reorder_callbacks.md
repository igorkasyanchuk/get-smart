## 🔍 Tip: Introspecting and Reordering Callbacks

For complex apps, inspect and reorder callbacks dynamically at runtime. Use the callback chain API to fetch and manipulate the list.

```ruby
class Product < ApplicationRecord
  before_save :touch_timestamp
  before_save :validate_price

  def self.move_callback(callback, to_index)
    chain = _save_callbacks.dup
    cb = chain.find { |c| c.filter == callback }
    chain.delete(cb)
    chain.insert(to_index, cb)
    reset_callbacks(:save)
    chain.each { |c| set_callback(:save, c.kind, c.filter) }
  end
end

# In an initializer:
Product.move_callback(:validate_price, 0)
```

This technique helps you resolve ordering issues without altering source code locations.