## 🧮 Define Methods Dynamically with Closures
`Module#define_method` can accept a block that captures local variables, enabling you to create methods at runtime with context-bound behavior. This is ideal for DSLs or repeatable patterns.

```ruby
class EventHandler
  [:create, :update, :delete].each do |action|
    define_method("on_#{action}") do |&block|
      instance_variable_set("@handler_#{action}", block)
    end
  end

  def trigger(action, *args)
    handler = instance_variable_get("@handler_")
    handler&.call(*args)
  end
end
```