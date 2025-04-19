## 🔍 Read Records with `find`, `find_by`, and `all`

Active Record offers various methods to fetch data: `find` raises an error if not found, `find_by` returns `nil`, and `all` returns every record. Use the one that matches your error-handling needs.

```ruby
# Raises ActiveRecord::RecordNotFound if ID 1 doesn't exist
user = User.find(1)

# Returns nil if no record matches
user = User.find_by(email: 'noone@example.com')

# Fetches all records (returns an ActiveRecord::Relation)
users = User.all
```  
