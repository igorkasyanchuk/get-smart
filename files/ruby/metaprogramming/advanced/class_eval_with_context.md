## 🛠️ `class_eval` with custom binding for context
Use `class_eval` (or `module_eval`) to reopen classes and inject methods or constants at runtime, optionally passing a string or block. You can access private methods and class-level state within the evaluation context.

```ruby
module Timestampable
  def self.apply(klass)
    klass.class_eval do
      def timestamped?
        created_at && updated_at
      end
    end
  end
end

# Usage:
Timestampable.apply(User)
```