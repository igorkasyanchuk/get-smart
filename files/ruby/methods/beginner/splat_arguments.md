## ✨ Variable Arguments with Splat
Use the splat operator (`*`) to accept a variable number of arguments as an array. Great for methods where you don’t know how many inputs you’ll need.

```ruby
def sum_all(*numbers)
  numbers.reduce(0, :+)
end

puts sum_all(1, 2, 3)    # => 6
puts sum_all(5, 10, 15)  # => 30
```