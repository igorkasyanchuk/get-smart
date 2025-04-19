## 📋 Chaining Multiple Callbacks
Rails invokes callbacks in the order you declare them. You can define several callbacks of the same kind to split logic into focused methods.

```ruby
class Comment < ApplicationRecord
  before_save :normalize_body
  before_save :append_signature

  private

  def normalize_body
    self.body = body.strip
  end

  def append_signature
    self.body += "\n-- User Signature"
  end
end
```

`normalize_body` runs first, then `append_signature`, resulting in clean, signed comments.