## 🛠️ Inspect and Manipulate Instance Variables
Use `instance_variables`, `instance_variable_get`, and `instance_variable_set` to inspect or modify an object’s state without exposing accessors. This is handy for serializers, object cloners, or debugging tools. Remember that altering internals can break invariants—use with care.

```ruby
class Session
  def initialize(user_id)
    @user_id = user_id
    @data = {}
  end
end

session = Session.new(42)
# List current instance variables
session.instance_variables  #=> [:@user_id, :@data]

# Read and modify them dynamically
uid = session.instance_variable_get(:@user_id)  #=> 42
session.instance_variable_set(:@data, { cart: [1,2,3] })
```