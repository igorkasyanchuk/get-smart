## ⚙️ Conditional Callbacks with `if` and `unless`
You can restrict when a callback runs by using `if:` or `unless:` options. This prevents unnecessary work for records that don't meet certain conditions.

```ruby
class Post < ApplicationRecord
  before_save :sanitize_content, if: :needs_sanitization?

  private

  def needs_sanitization?
    content_changed?
  end

  def sanitize_content
    self.content = Sanitize.fragment(content)
  end
end
```

Here, sanitization only occurs if the `content` attribute has changed.