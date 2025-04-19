## 🔍 Safely Call Methods with try

Use `try` to call a method on an object that might be `nil` without raising an error. If the object is `nil`, `try` returns `nil` instead of throwing a NoMethodError.

```ruby
user = nil
user.try(:name)    # => nil

user = User.new(name: "Bob")
user.try(:name)    # => "Bob"
```
