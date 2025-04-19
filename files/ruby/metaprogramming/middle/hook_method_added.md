## 📌 Hooking into method_added

`method_added` is a hook called whenever a new instance method is defined. Use it to wrap or annotate methods automatically—for example, adding logging or instrumentation.

```ruby
module MethodLogger
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def method_added(name)
      return if @_adding_wrapper
      @_adding_wrapper = true

      original = instance_method(name)
      define_method(name) do |*args, &block|
        puts "Calling \#{name} with \\#{args.inspect}"
        original.bind(self).call(*args, &block)
      end

      @_adding_wrapper = false
    end
  end
end

class Worker
  include MethodLogger

  def perform(x)
    x * 2
  end
end

Worker.new.perform(10)
# Logs: Calling perform with [10]
```