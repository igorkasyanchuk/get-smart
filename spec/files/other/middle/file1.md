### 💎 Ruby Tip: String interpolation with `%{}` and hashes

In Ruby, you can conveniently interpolate strings using `%{}` syntax combined with hashes for cleaner, readable code.

**Example:**

```ruby
user = { name: "Alice", age: 30 }

message = "Hello %{name}, you're %{age} years old!" % user

puts message
# Output: Hello Alice, you're 30 years old!
```
