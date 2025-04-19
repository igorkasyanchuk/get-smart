## 📋 Inclusion and Exclusion Validation

Restrict attribute values to a predefined list with `inclusion`, or forbid certain values with `exclusion`. This enforces domain constraints like roles or statuses. Provide an array for the `in` option in your model.

```ruby
class Membership < ApplicationRecord
  validates :role, inclusion: { in: %w[admin user guest], message: 'is not a valid role' }
  validates :code, exclusion: { in: %w[INVALID BANNED] }
end
```
