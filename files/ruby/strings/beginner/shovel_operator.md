## 🛠️ Appending with `<<`

The shovel operator (`<<`) appends content to the original string in place, which is more efficient than `+` when building a string iteratively. Beware that it mutates the receiver and may affect other references to it.

```ruby
str = "Item:"
str << " Book"
str << ", Pen"
puts str  # => Item: Book, Pen
```