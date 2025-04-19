## 🎯 Use Module#delegate for Clean API

`delegate` allows you to forward method calls to associated objects directly, reducing boilerplate. This helps keep your models and decorators lean.

```ruby
class User
  belongs_to :account
  delegate :name, :email, to: :account
end

user = User.first
user.name    # Invokes user.account.name
user.email   # Invokes user.account.email
```
