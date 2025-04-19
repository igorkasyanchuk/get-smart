## 🔄 Conditional Assignment (||=)

The `||=` operator assigns a value only if the variable is `nil` or `false`. It’s useful for setting defaults without overwriting existing values.

```ruby
name = nil
name ||= "Guest"  # name becomes "Guest"

role = "admin"
role ||= "user"    # role stays "admin" because it's truthy
```