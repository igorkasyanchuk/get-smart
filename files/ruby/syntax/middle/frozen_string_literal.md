## ❄️ Optimizing with Frozen String Literals

Adding `# frozen_string_literal: true` at the top of Ruby files freezes all literals, reducing object allocations and improving performance.

```ruby
# frozen_string_literal: true

def greet
  message = "Hello, world!"
  puts message
end

# Every string literal in this file is immutable, saving memory.
```