## ⏱️ Validation Contexts with `on:`
Run certain validations only during create, update, or custom contexts. This is useful when workflows impose different rules at different stages of a record’s lifecycle.

```ruby
class Account < ApplicationRecord
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true, on: [:create, :update]
end

# Custom context
account.valid?(:approve)
```
