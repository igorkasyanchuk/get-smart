## 🤝 Combining Arrays
You can merge arrays with the `+` operator or the `concat` method. The `+` operator returns a new array, while `concat` modifies the original one.

```ruby
a = [1, 2]
b = [3, 4]

# Non-destructive
c = a + b   # => [1,2,3,4], a unchanged

# Destructive
a.concat(b) # => [1,2,3,4], a is now modified
```