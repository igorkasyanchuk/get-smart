## 🚨 Using Strict Validations to Raise Exceptions

Strict validations immediately raise exceptions on failure, making it easier to catch invalid records in transactional flows rather than ignoring errors silently.

```ruby
# app/models/user.rb
class MissingUsernameError < StandardError; end

class User < ApplicationRecord
  validates :username, presence: { strict: MissingUsernameError }
end

# Usage in service
begin
  User.create!(username: nil)
rescue MissingUsernameError => e
  # cleanup or notify
end
```