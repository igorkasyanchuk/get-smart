## 📌 Defining Constants for Shared Values

Store shared, unchanging values (e.g., roles or statuses) as constants in your model to avoid magic strings.

```ruby
class User < ApplicationRecord
  ROLES = %w[admin moderator member].freeze

  validates :role, inclusion: { in: ROLES }
end

# Usage:
User::ROLES  # => ["admin", "moderator", "member"]
```

Freezing the array prevents accidental modifications at runtime.