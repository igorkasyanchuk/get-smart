## 🔧 Leveraging `Module#prepend` for Method Wrapping
Unlike `include`, `prepend` places your module before the class in the lookup chain, making it ideal for wrapping or overriding methods. Use it to instrument or augment existing behavior without altering the original method definition. This approach is cleaner than alias chaining and preserves method visibility.

```ruby
module Logging
  def save(*args)
    puts "[LOG] Saving #{self.class} with \\u{2026}"
    super
  end
end

class Record
  prepend Logging
  def save
    # heavy lifting
  end
end
```

`Logging#save` runs first, then calls the original via `super`.