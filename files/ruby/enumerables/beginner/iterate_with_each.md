## 🔁 Iterate with each
The `each` method is the most basic way to loop through enumerable collections in Ruby. It yields each element to a block, allowing you to perform operations such as printing, modifying, or accumulating values. Use `each` when you need to process items one by one without changing the original collection.

```ruby
numbers = [1, 2, 3, 4, 5]
numbers.each do |n|
  puts "Number: #{n}"
end

# Shorthand with braces:
numbers.each { |n| puts n * 2 }
```