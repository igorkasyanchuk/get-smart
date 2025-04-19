## 🧩 Building Internal DSLs with `Module#included`
Use the `included` hook to inject class-level methods when your module is mixed in, crafting a neat internal DSL. This technique initializes configuration, sets up callbacks, or defines macros dynamically on the host class.

```ruby
module ActsAsAuditable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_auditable
      include InstanceMethods
      before_save :audit_changes
    end
  end

  module InstanceMethods
    def audit_changes
      # log changes
    end
  end
end

class User
  include ActsAsAuditable
  acts_as_auditable
end
```

This pattern cleanly separates DSL declaration from implementation details.