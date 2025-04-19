## 🆔 `find` vs `find_by`

`find` retrieves a record by its primary key and raises an exception if not found. `find_by` returns the first matching record or `nil` when none exists. Use `find_by` for safe lookups when the record might not exist.

```ruby
# Raises ActiveRecord::RecordNotFound if ID 1 doesn't exist
user = User.find(1)

# Returns nil if no user with email exists
user = User.find_by(email: 'user@example.com')
```