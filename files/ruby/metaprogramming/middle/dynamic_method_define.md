## 🎯 Dynamic Method Definition with define_method

Using `define_method` lets you create methods at runtime, reducing repetition and enabling flexible APIs. You can loop over data sets to generate similar methods dynamically, making your classes more DRY and maintainable.

```ruby
class MyClass
  %i[foo bar baz].each do |name|
    define_method(name) do
      "Called #{name}!"
    end
  end
end

o = MyClass.new
puts o.foo  # => "Called foo!"
```