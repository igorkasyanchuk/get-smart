## 🚀 Endless and Beginless Ranges
Ruby 2.6+ introduced endless (`..`) and beginless (`..x`) ranges, which are perfect for slicing and open‑ended queries without manually calculating indices. Use them to grab the tail of an array or substring of a string effortlessly.

```ruby
arr = [1, 2, 3, 4, 5]
p p arr[2..]      # => [3, 4, 5]        (from index 2 to end)
p p arr[..2]      # => [1, 2, 3]        (from start through index 2)

str = "abcdef"
p p str[..2]      # => "abc"

# You can even define truly endless ranges
range = (10..)
p p range.first(3) # => [10, 11, 12]
```