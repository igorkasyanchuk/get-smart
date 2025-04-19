## 🔀 Conditional Validations
Use `if` and `unless` options to apply validations only when certain conditions are met. This helps you avoid unnecessary errors and keep your models clean. You can pass a symbol, a `Proc`, or a string to control when the validation runs.

```ruby
class User < ApplicationRecord
  validates :profile_complete, presence: true, if: :signed_up_and_active?

  private

  def signed_up_and_active?
    signed_up? && active?
  end
end
```
