## 🚀 Fetch Specific Columns with `pluck` and `select`

Reduce memory usage by loading only needed fields. Use `pluck` when you only need raw values, and `select` when you want model instances with partial attributes.

```ruby
# Get an array of email strings:
emails = User.where(subscribed: true).pluck(:email)

# Load only id and name into User objects:
users = User.select(:id, :name).where('created_at > ?', 1.month.ago)
```