## 🔄 Iterating with `each`
The `each` method lets you loop over arrays or hashes cleanly using a block. Blocks can be defined with `do...end` or curly braces. This pattern is idiomatic in Ruby for collections.

```ruby
numbers = [1, 2, 3]
numbers.each do |n|
  puts n * 2
end

# Hash iteration
config = { timeout: 5, debug: true }
config.each { |key, value| puts "#{key} => #{value}" }
```