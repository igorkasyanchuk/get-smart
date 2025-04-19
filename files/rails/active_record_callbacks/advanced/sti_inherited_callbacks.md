## 👪 Tip: Managing Inherited Callbacks in STI

Single Table Inheritance can lead to unexpected callbacks firing. Use `skip_callback` in subclasses to remove parent callbacks or `around_*` to wrap them.

```ruby
class Animal < ApplicationRecord
  before_save :log_generic_event
end

class Dog < Animal
  skip_callback(:save, :before, :log_generic_event)
  before_save :log_dog_event
end
```

This approach clarifies which hooks apply to each subclass, preventing cross‐type side effects.