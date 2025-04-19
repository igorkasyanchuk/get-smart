## 💡 Keyword Arguments
Keyword arguments make your code more readable by explicitly naming parameters in the call. Define them using `param:` syntax and optionally set defaults.

```ruby
def order(item:, quantity: 1)
  "Ordered #{quantity} x #{item}"
end

puts order(item: "Book")            # => "Ordered 1 x Book"
puts order(item: "Pen", quantity: 3) # => "Ordered 3 x Pen"
```