## 🔁 Iterating with each
The `each` method is your go-to for looping through array elements. It yields each item to a block, where you can perform actions like logging or accumulating results.

```ruby
names = ['Alice', 'Bob', 'Carol']

names.each do |name|
  puts "Hello, #{name}!"
end
# Output:
# Hello, Alice!
# Hello, Bob!
# Hello, Carol!
```