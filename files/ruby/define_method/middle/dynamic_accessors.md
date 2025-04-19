## 🖋️ Dynamic Accessors

You can use `define_method` to generate attribute readers and writers on the fly, reducing boilerplate for simple data objects. This is especially handy when you don’t know the attributes at class-definition time.

```ruby
class DataObject
  def initialize(attrs = {})
    attrs.each do |name, value|
      self.class.define_method(name) { instance_variable_get("@#{name}") }
      self.class.define_method("#{name}=") { |val| instance_variable_set("@#{name}", val) }
      send("#{name}=", value)
    end
  end
end

obj = DataObject.new(name: "Alice", age: 30)
puts obj.name  # => "Alice"
obj.age = 31
puts obj.age   # => 31
```

Here, you iterate over a hash of attributes and define getters/setters dynamically, keeping your class definition DRY.