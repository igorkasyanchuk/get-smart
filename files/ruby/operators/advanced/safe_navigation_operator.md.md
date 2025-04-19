## 🔒 Safe Navigation Operator

The safe navigation operator (`&.`) helps you chain method calls without worrying about `nil` checks at each step, avoiding `NoMethodError`. It returns `nil` instead of raising an error when encountering a `nil` receiver. Use it in complex chains or when dealing with optional objects.

```ruby
user = nil
default_email = "guest@example.com"
# Without safe navigation:
email = user && user.profile && user.profile.email || default_email
# With safe navigation:
email = user&.profile&.email || default_email
puts email # => "guest@example.com"
```