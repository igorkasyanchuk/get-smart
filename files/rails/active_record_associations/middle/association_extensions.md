## 📦 Extending Associations with Custom Methods

You can add custom methods to an association using a block. This creates an extension module scoped to that specific relation, keeping helper logic encapsulated and clean. Extended methods work lazily on the association proxy.

```ruby
class User < ApplicationRecord
  has_many :events do
    def upcoming
      where("start_time > ?", Time.current)
    end
  end
end

# Usage:
user.events.upcoming
```
