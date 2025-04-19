## 🚀 Extend Modules to Add Class Methods

Use `extend` to add module methods as class methods. This is handy for providing utility methods directly on the class. Unlike `include`, `extend` modifies the calling class’s singleton class.

```ruby
module Finder
  def find(id)
    # look up by id
  end
end

class Record
  extend Finder
end

Record.find(1)
```