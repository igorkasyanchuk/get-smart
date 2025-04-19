## 🛠️ Defining Methods with Custom Visibility and Hooks

Enhance `define_method` with custom visibility settings and automatic hooks to register or modify behavior immediately after definition.

```ruby
module Hookable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def define_with_hooks(name, visibility=:public, &block)
      define_method(name, &block)
      send(visibility, name)
      after_define(name)
    end

    # Hook invoked after each definition
    def after_define(name)
      (@_defined_methods ||= []) << name
    end

    def defined_methods
      @_defined_methods || []
    end
  end
end

class MyService
  include Hookable

  define_with_hooks(:perform, :private) do |data|
    puts "Processing "+data.to_s
  end
end

MyService.defined_methods  # => [:perform]
MyService.private_instance_methods.include?(:perform) # => true
```