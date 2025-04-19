## 🛠️ Define Methods Dynamically with `define_method`

Ruby’s `define_method` lets you create methods at runtime, giving you flexibility in API design. You can loop over a list of attributes or actions and generate methods in a DRY way. This is especially useful when you want similar behavior for multiple method names without repeating code.

```ruby
class GreetingBuilder
  %i[hello goodbye].each do |method_name|
    define_method(method_name) do |name|
      "#{method_name.to_s.capitalize}, #{name}!"
    end
  end
end

gb = GreetingBuilder.new
puts gb.hello("Alice")   # => "Hello, Alice!"
puts gb.goodbye("Bob")   # => "Goodbye, Bob!"
```