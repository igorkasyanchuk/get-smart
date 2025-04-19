## 💼 Dynamic Instance Variable Management

Use `instance_variable_set`, `instance_variable_get`, and `remove_instance_variable` to manage object state dynamically, especially when keys or attributes aren’t known at compile time. This technique is powerful for building DSLs or serializers that map arbitrary data into Ruby objects.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def set_prop(key, value)
    instance_variable_set("@#{key}", value)
  end

  def get_prop(key)
    instance_variable_get("@#{key}")
  end

  def remove_prop(key)
    ivar = "@#{key}"
    remove_instance_variable(ivar) if instance_variable_defined?(ivar)
  end
end

person = Person.new("Alice")
person.set_prop(:age, 30)
p person.get_prop(:age)          # => 30
p person.instance_variables      # => [:@name, :@age]
person.remove_prop(:age)
p person.instance_variables      # => [:@name]
```