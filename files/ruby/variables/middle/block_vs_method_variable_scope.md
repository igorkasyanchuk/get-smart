## 🔐 Understand Variable Scope in Blocks vs Methods

Ruby’s blocks and methods handle local variables differently. Blocks are closures that can read and modify variables from the surrounding scope, whereas method definitions introduce a new local scope. Knowing this distinction prevents `NameError`s and unintended side effects.

```ruby
# Block scope shares outer variables
x = 5
3.times do |i|
  x += i
end
puts x  # => 8 (5 + 0 + 1 + 2)

# Method scope is isolated
def update_y
  y = 10
end
update_y
puts defined?(y)  # => nil (y is not accessible here)

# Block parameters shadow outer variables
value = 100
[1, 2, 3].each do |value|
  puts value      # prints 1, 2, 3
end
puts value        # => 100 (outer `value` unchanged)
```