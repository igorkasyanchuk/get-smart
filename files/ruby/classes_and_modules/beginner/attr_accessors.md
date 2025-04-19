## 🔓 Simplify Accessors with `attr_*`

Ruby provides `attr_reader`, `attr_writer`, and `attr_accessor` to generate getter and setter methods automatically. This reduces boilerplate and keeps your class definition concise. Choose the appropriate accessor method based on whether you need read, write, or both.

```ruby
class Person
  attr_reader :name       # getter only
  attr_writer :age        # setter only
  attr_accessor :email    # both getter and setter

  def initialize(name)
    @name = name
  end
end
```