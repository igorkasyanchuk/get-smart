## 🔧 Use pluck for Simple Queries
When you only need specific columns instead of full ActiveRecord objects, `pluck` can fetch data directly from the database. This lowers memory usage and speeds up query execution.

```ruby
# Fetch all user emails (loads full objects)
emails = User.select(:email).map(&:email)

# Using pluck (direct array of values)
emails = User.pluck(:email)
```