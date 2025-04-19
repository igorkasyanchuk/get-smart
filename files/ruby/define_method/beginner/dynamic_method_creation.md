## ✨ Dynamically Create Simple Methods

Using `define_method` lets you add methods to a class at runtime, perfect for reducing boilerplate. Instead of writing out each method by hand, you can loop over a list and define them dynamically.

```ruby
class Greeter
  %i[morning afternoon evening].each do |period|
    define_method("greet_#{period}") do |name|
      "Good #{period.to_s.capitalize}, #{name}!"
    end
  end
end

g = Greeter.new
puts g.greet_morning("Alice")   # => "Good Morning, Alice!"
puts g.greet_evening("Bob")     # => "Good Evening, Bob!"
```