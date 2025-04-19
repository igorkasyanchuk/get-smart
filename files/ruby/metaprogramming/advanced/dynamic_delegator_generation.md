## 🧩 Generating delegators on the fly
Automate `delegate` declarations by reading a list of methods and creating delegators via `Module#define_method` and `send`, customizing targets dynamically.

```ruby
module DynamicDelegator
  def delegate_methods(target, *methods)
    methods.each do |m|
      define_method(m) { |*args| send(target).public_send(m, *args) }
    end
  end
end

class Presenter
  extend DynamicDelegator
  delegate_methods :model, :name, :email
end
```