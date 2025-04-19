## 🧬 Composable Concerns via Module#append_features

Emulate ActiveSupport::Concern by defining an `included` hook to inject both instance and class methods in a clean, composable fashion. This pattern avoids naming collisions and simplifies dependencies between modules.

```ruby
module Concern
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def append_features(mod)
      super
      const_get(:ClassMethods).each do |m|
        mod.define_singleton_method(m) { |*args| super(*args) }
      end
    end
  end
end

module Auditable
  include Concern

  def record_change; puts 'Change recorded'; end

  module ClassMethods
    def audit_all; puts 'Auditing all records'; end
  end
end

class Record
  include Auditable
end

Record.new.record_change  # => "Change recorded"
Record.audit_all          # => "Auditing all records"
```