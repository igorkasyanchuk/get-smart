## 🎛️ Dynamic Class Configuration with class_exec and instance_exec

Use `class_exec` and `instance_exec` to inject behavior or configuration into classes and objects at runtime. This empowers feature toggles and context-sensitive augmentation without reopening classes globally.

```ruby
module Configurable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def configure(&block)
      class_exec(&block)
    end
  end
end

class Payment
  include Configurable

  configure do
    @gateway = :stripe
    def self.gateway
      @gateway
    end
  end
end

puts Payment.gateway  # => :stripe
```