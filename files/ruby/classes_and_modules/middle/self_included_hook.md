## 🛠️ Using `self.included` for Configuration

The `self.included(base)` hook lets a module configure the host class when included. This is useful for adding class methods, setting defaults, or injecting callbacks. Keep the setup logic contained and maintainable.

```ruby
module Timestampable
  def self.included(base)
    base.extend ClassMethods
    base.before_save :set_timestamp
  end

  module ClassMethods
    def before_save(method)
      @callbacks ||= []
      @callbacks << method
    end
  end

  def set_timestamp
    self.updated_at = Time.now
  end
end

class Record
  include Timestampable
end
```