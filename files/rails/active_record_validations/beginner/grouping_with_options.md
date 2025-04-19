## 📦 Grouping Validations with with_options

Reduce repetition by grouping common validation options using `with_options`. This makes your model cleaner when multiple attributes share rules, such as presence or format.

```ruby
class Person < ApplicationRecord
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :birthdate
  end
end
```
