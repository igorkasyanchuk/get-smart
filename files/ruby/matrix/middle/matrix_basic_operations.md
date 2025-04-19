## 🔢 Working with Basic Matrix Operations
The `Matrix` class in Ruby provides a straightforward way to perform addition, subtraction, and multiplication on matrices without manual iteration. Always require the stdlib and initialize matrices using arrays of rows. You can then use `+`, `-`, and `*` operators directly.

```ruby
require 'matrix'

m1 = Matrix[[1, 2], [3, 4]]
m2 = Matrix[[5, 6], [7, 8]]

sum        = m1 + m2       # => Matrix[[6,8],[10,12]]
difference = m2 - m1       # => Matrix[[4,4],[4,4]]
product    = m1 * m2       # => Matrix[[19,22],[43,50]]
```

Using these operators makes the code concise and readable, avoiding nested loops.