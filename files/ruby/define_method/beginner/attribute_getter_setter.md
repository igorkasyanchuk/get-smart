## 🔑 Build Custom Getters and Setters

`define_method` can replace repetitive attribute reader/writer methods. You can generate custom getters and setters with validation or transformation logic.

```ruby
class Person
  %i[name age].each do |attr|
    define_method(attr) do
      instance_variable_get("@#{attr}")
    end

    define_method("#{attr}=") do |value|
      # Example: ensure age is non-negative
      if attr == :age && value < 0
        raise ArgumentError, "Age must be >= 0"
      end
      instance_variable_set("@#{attr}", value)
    end
  end
end

p = Person.new
p.name = "Carol"
puts p.name       # => "Carol"
p.age = 30        # works
# p.age = -5      # raises ArgumentError