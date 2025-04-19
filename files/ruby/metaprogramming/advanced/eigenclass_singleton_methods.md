## 🎯 Eigenclass for per‑object metaprogramming
Open an object’s singleton class to add methods specific to that instance, giving you fine‑grained control over behavior without affecting other instances.

```ruby
user = User.new
class << user
  def greet
    "Hello, #{name}!"
  end
end

user.greet # => "Hello, Alice!"
```