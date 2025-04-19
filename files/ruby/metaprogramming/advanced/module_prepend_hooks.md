## 🤖 Aspect‑oriented hooks with `Module#prepend`
Use `prepend` to inject modules before a class’s own methods, enabling AOP-like pre/post hooks without aliasing. This preserves method visibility and avoids method_missing complexity.

```ruby
module Logging
  def save(*args)
    puts "Saving: #{self.inspect}"
    super
  end
end

class Record
  prepend Logging

  def save
    # actual save logic
  end
end
```