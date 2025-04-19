## 🧩 Leverage ActiveSupport::Concern for Modular Dependencies
ActiveSupport::Concern simplifies module inclusion by managing dependencies and callbacks. Use `included` blocks to inject behaviour and ensure load order. This allows you to break large services into composable concerns without manual `super` calls.

```ruby
module Auditable
  extend ActiveSupport::Concern

  included do
    before_save :record_changes
  end

  class_methods do
    def audit_strategy(strategy)
      cattr_accessor :strategy
      self.strategy = strategy
    end
  end

  private

  def record_changes
    strategy.log(self.changes)
  end
end

class Order
  include Auditable
  audit_strategy(MyCustomAuditor)
end
```
