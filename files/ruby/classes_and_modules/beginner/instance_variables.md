## 🎯 Use Instance Variables

Instance variables (prefixed with `@`) hold object-specific data and are available across instance methods. They are created when first assigned, without needing explicit declaration. Use them to store the state of each object.

```ruby
class Person
  def set_name(name)
    @name = name
  end

  def get_name
    @name
  end
end
```