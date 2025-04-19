## 🧠 Advanced Meta-programming with `singleton_class`
Tap into an object’s eigenclass to define per-object behavior or dynamic singleton methods. This is powerful for runtime customization without affecting the class globally.

```ruby
user = User.new
class << user
  def greet
    "Hi, I am #{name}, the special instance!"
  end
end

puts user.greet  # Only this user responds
```

For more dynamic use, you can inject modules into the singleton class to simulate per-object mixins.