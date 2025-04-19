## ➕ Basic Arithmetic Operations

Ruby supports all common arithmetic operators: addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`), and modulo (`%`). Note that dividing two Integers returns an Integer unless you convert one operand to Float.

```ruby
a = 10
b = 3

puts a + b        # => 13
puts a - b        # => 7
puts a * b        # => 30
puts a / b        # => 3        # integer division
puts a.to_f / b   # => 3.3333333333333335
puts a % b        # => 1        # remainder
```