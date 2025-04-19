## 🧮 Combine Result Sets with UNION
Use Arel's `union` or raw SQL to merge two ActiveRecord relations into one result set without duplicate rows. This is useful when querying similar data from different tables or conditions.

```ruby
arel1 = User.where(active: true).arel
arel2 = Admin.where(active: true).arel
combined_sql = arel1.union(arel2).to_sql
records = ActiveRecord::Base.connection.exec_query(combined_sql)
```
