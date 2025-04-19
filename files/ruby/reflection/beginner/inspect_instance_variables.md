## 🕵️‍♂️ Inspect and Access Instance Variables
Reflection can also reveal an object's internal state by listing its instance variables. Use `instance_variables` and `instance_variable_get` to peek at or retrieve these values.

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age  = age
  end
end

person = Person.new("Bob", 30)
# List all instance variable names
p person.instance_variables  #=> [:@name, :@age]

# Retrieve the actual value of @name
p person.instance_variable_get(:@name)  #=> "Bob"
```

This is handy for debugging or serializing objects without explicitly defining getters.