## 🔧 Build a Fluent DSL with define_method in Hooks

For internal DSLs, you can dynamically inject chainable methods by defining them in the module’s `included` hook. Using `define_method` inside `self.included` allows classes to declare fluent behaviors concisely, generating methods on-the-fly.

```ruby
module Fluent
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def fluent(*names)
      names.each do |name|
        define_method(name) do |*args|
          @chain ||= []
          @chain << "#{name}(#{args.join(',')})"
          self
        end
      end
    end
  end
end

class Query
  include Fluent
  fluent :select, :where, :order
end

q = Query.new.select('users').where('age>18').order('name')
```