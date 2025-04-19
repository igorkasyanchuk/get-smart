## ⚡️ Fetching Specific Attributes with `pluck`

When you only need certain fields, `pluck` retrieves them directly from the database, bypassing Active Record object creation. This reduces memory usage and speeds up simple attribute queries.

```ruby
# Get all active users' email addresses
emails = User.where(active: true).pluck(:email)
```