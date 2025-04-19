## 🔍 Introspect Methods
Use `methods`, `public_methods`, `instance_methods`, and filtering to discover what an object or class can do at runtime. This helps in building dynamic features such as auto-generated API docs or dynamic dispatchers. You can also filter out inherited methods or private ones to focus on your own.

```ruby
class User
  def login; end
  def logout; end
end

# List all public instance methods defined on User (excluding ancestors)
User.instance_methods(false) #=> [:login, :logout]

# List only singleton methods on an instance
user = User.new
def user.special; end
user.methods(false) #=> [:special]
```