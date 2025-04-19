## 📝 Using Conditional Associations with Lambdas

Conditional associations let you define relationships that only include records meeting a specified condition. This is great for separating states like `active`, `archived`, or custom flags directly at the model level.

```ruby
class User < ApplicationRecord
  has_many :active_sessions, -> { where(active: true) }, class_name: "Session"
  has_many :archived_sessions, -> { where(active: false) }, class_name: "Session"
end

# Usage:
user.active_sessions
user.archived_sessions
```
