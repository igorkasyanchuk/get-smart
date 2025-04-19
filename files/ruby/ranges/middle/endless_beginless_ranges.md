## 🔄 Leveraging Endless and Beginless Ranges

Introduced in Ruby 2.6, endless (`start..`) and beginless (`..end`) ranges let you express open-ended intervals elegantly. They’re especially handy for slicing, filtering, and default bounds checks without explicitly specifying both endpoints.

```ruby
# Endless range starting from 5
enums = (5..)
puts enums.first(3)  # => [5, 6, 7]

# Beginless range up to 100
nums = (..100)
puts nums.cover?(0)  # => true

# Combining with Array#slice
data = [10,20,30,40,50]
slice = data[2..]  # => [30,40,50]
```