## 📊 Common Table Expressions (CTEs)

CTEs simplify complex queries by breaking them into named subqueries. Use Rails 6+ `with` to chain CTEs for readability and reuse.

```ruby
recent_sales = Sale.select(:user_id, "SUM(amount) AS total").where("created_at > ?", 1.month.ago).group(:user_id)
User.with(recent_sales: recent_sales).joins("JOIN recent_sales ON recent_sales.user_id = users.id")
    .select("users.*, recent_sales.total")
```