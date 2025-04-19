## 🎯 Select Specific Columns

Reduce payload size and database workload by selecting only the columns you need. This is especially helpful when your table has wide columns like text or binary data.

```ruby
# Only fetch id, name, and email for the list view
@users = User.select(:id, :name, :email)
```
