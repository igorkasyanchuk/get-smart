## 🔑 Accessing Values Safely
Accessing a non-existent key returns `nil`, so you must handle missing keys to avoid unexpected errors. Use the safe navigation operator or check for `nil` before working with the value.

```ruby
inventory = { apples: 10, bananas: 5 }
stock = inventory[:oranges]  # => nil

if stock.nil?
  puts "No oranges in stock"
else
  puts "We have #{stock} oranges"
end
```