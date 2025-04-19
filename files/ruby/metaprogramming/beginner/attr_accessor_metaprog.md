## 🛡️ Generate Accessors with `attr_accessor`

Ruby’s `attr_accessor`, `attr_reader`, and `attr_writer` are simple metaprogramming shortcuts for defining getter/setter methods. Instead of writing boilerplate, list attribute names and let Ruby auto-generate the methods.

```ruby
class User
  attr_accessor :name, :email
end

u = User.new
u.name = "Carol"
u.email = "carol@example.com"
puts u.name   # => "Carol"
```