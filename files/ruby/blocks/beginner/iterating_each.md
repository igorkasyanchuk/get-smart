## 🔄 Iterating Over Arrays with each
The `each` method lets you loop through every element in an array and perform an action for each item. It's one of the most common ways to work with collections in Ruby.

```ruby
colors = ["red", "green", "blue"]
colors.each do |color|
  puts "Color: #{color}"
end
# Output:
# Color: red
# Color: green
# Color: blue
```