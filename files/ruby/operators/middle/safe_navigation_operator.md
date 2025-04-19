## 🔒 Safe Navigation Operator
The safe navigation operator (`&.`) helps avoid `NoMethodError` when calling methods on `nil`. It returns `nil` instead of raising an exception, making your code more concise and nil-safe.

```ruby
user = nil
# Without safe navigation
# user.profile.name # => NoMethodError: undefined method `profile' for nil:NilClass

# With safe navigation
user&.profile&.name # => nil
```