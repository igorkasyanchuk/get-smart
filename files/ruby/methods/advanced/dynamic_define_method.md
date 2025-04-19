## 🛠️ Dynamic Method Definitions with `define_method`
Use `define_method` inside modules or classes to generate methods at runtime, reducing duplication and enabling DSLs. You gain access to closures, so you can capture surrounding variables or behaviors.

```ruby
class Serializer
  %i[name age email].each do |attr|
    define_method("serialize_#{attr}") do |object|
      value = object.public_send(attr)
      "#{attr}: #{value}\n"
    end
  end
end

serializer = Serializer.new
puts serializer.serialize_name(OpenStruct.new(name: 'Alice'))
```