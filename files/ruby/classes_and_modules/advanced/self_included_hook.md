## ⚙️ Using `included` Hook to Extend Class Methods

Modules can automatically add both instance and class methods to classes on inclusion by defining `self.included`. This lets you group related behaviors in one place.

```ruby
module Auditable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def audit_logs
      @logs ||= []
    end
  end

  def log_change(msg)
    self.class.audit_logs << msg
  end
end

class User
  include Auditable
end

User.new.log_change("created")
p User.audit_logs # => ["created"]
```