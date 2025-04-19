## 🚀 Select Computed Attributes with Arel
Compute dynamic attributes at query time and return them alongside model fields. Use `Arel.sql` or Arel nodes to calculate values like discounts, full names, or timestamps differences directly in SQL.

```ruby
users = User
  .select(
    :id,
    :first_name,
    :last_name,
    Arel.sql("(EXTRACT(epoch FROM (NOW() - created_at)) / 86400)::int AS days_since_signup")
  )
```
