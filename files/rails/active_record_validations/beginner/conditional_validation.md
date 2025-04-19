## ⏳ Conditional Validations

Apply validations only under certain conditions using `if` or `unless` options. This is useful for optional fields or staged forms. Pass a symbol, proc, or method name to control when the validation runs.

```ruby
class User < ApplicationRecord
  validates :phone_number, presence: true, if: :phone_required?

  def phone_required?
    emergency_contact.present?
  end
end
```
