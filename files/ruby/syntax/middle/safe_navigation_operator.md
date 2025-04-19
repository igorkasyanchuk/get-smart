## 🔍 Using the Safe Navigation Operator

The safe navigation operator (`&.`) lets you call methods on objects that might be `nil` without raising a `NoMethodError`. It returns `nil` if the receiver is `nil`, making chained calls safer and more concise.

```ruby
user = nil
# Without safe navigation, this raises an error:
# user.name #=> NoMethodError

# With safe navigation:
user&.name  #=> nil

user = OpenStruct.new(name: "Alice")
user&.name  #=> "Alice"
```