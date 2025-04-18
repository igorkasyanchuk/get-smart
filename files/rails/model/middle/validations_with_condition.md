## 🛡️ Use conditional validations for flexible model validation

Sometimes you want validations to run only under certain conditions. Use the `:if` and `:unless` options with validations:

```ruby
class User < ApplicationRecord
  validates :nickname, presence: true, if: :nickname_required?

  def nickname_required?
    self.age >= 18
  end
end
```

This will ensure `nickname` is present only if the user is 18 or older.