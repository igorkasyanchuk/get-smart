## 🧰 Meta-Programming with Method Hooks
Intercept method definitions using `method_added` and `singleton_method_added` for instrumentation, analytics, or automated wrapping. Prepended modules can also hook into these events without polluting the target class.

```ruby
module Tracker
  def self.prepended(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def method_added(name)
      super
      puts "Added instance method: #{name}"
    end

    def singleton_method_added(name)
      super
      puts "Added class method: #{name}"
    end
  end
end

class Service
  prepend Tracker

  def perform; end
  def self.run; end
end
# Output:
# Added instance method: perform
# Added class method: run
```