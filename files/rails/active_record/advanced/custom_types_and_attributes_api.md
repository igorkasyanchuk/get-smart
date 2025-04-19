## 🗃 Custom Types with Attributes API

Define custom types for specialized serialization, coercion, and change tracking. Great for encrypted fields, money, or custom parsing logic.

```ruby
class MoneyType < ActiveRecord::Type::Value
  def cast(value)
    Monetize.parse(value)
  end
  def serialize(value)
    value.to_s
  end
end

class Product < ApplicationRecord
  attribute :price, MoneyType.new
end
```
This ensures `product.price` returns a `Money` object, transparently handling input and output.