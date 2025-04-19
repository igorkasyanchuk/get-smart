## 📋 Utilize Common Table Expressions (CTEs)
CTEs let you break complex queries into named subqueries for clarity and reuse. Rails >=6 supports CTEs via `relation.with` or external gems like `activerecord-cte`. This is invaluable for recursive queries or querying hierarchical data without raw SQL spaghetti.

```ruby
# Using Rails built-in with (Rails 6+)
sales_by_month = Sale.group("DATE_TRUNC('month', created_at)").count
monthly = Sale
  .with(monthly_sales: sales_by_month)
  .from("monthly_sales as ms")
  .select("ms.date_trunc, ms.count")
```
