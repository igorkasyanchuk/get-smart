## 📦 Emulating `alias_method_chain` safely
Create method chains by aliasing the original implementation and redefining the method, then invoking the aliased version. This pattern is explicit and avoids monkey‑patch pitfalls.

```ruby
module Auditable
  def self.included(base)
    base.class_eval do
      alias_method :save_without_audit, :save

      def save(*args)
        audit_changes
        save_without_audit(*args)
      end
    end
  end
end

class Model
  include Auditable

  def save
    # persistence logic
  end
end
```