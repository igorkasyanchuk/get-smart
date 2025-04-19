## 🛠️ Using Blocks in Model Callbacks
You can pass a block directly to a callback for quick, inline logic. This is handy for very simple operations without extracting a private method.

```ruby
class Invoice < ApplicationRecord
  before_create do
    self.token = SecureRandom.hex(10)
  end
end
```

In this example, an inline block assigns a random `token` to each new invoice right before creation.