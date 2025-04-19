## 🔑 Uniqueness Validation

Ensure an attribute’s value is unique across records to prevent duplicates, often used for usernames or emails. Combine with a database unique index for full protection. Simply add `uniqueness: true` in your model.

```ruby
class User < ApplicationRecord
  validates :username, uniqueness: true
end
```
