## ⏰ Building a Callback System

Implement custom callbacks to hook into your object’s lifecycle. Use metaprogramming to register and trigger callback methods dynamically.

```ruby
module Callbackable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def define_callback(name)
      @callbacks ||= {}
      @callbacks[name] = []

      define_method("on_#{name}") do |&block|
        self.class.instance_variable_get(:@callbacks)[name] << block
      end
    end

    def callbacks
      @callbacks || {}
    end
  end

  def trigger(name)
    self.class.callbacks[name].each { |cb| cb.call(self) }
  end
end

class Task
  include Callbackable
  define_callback :start

  on_start { |task| puts "Task started: \\#{task}" }

  def run
    trigger(:start)
  end
end

Task.new.run  # => "Task started: #<Task:0x...>"
```