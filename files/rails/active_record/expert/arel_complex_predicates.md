## 🚀 Deep Arel Predicates for Complex Queries
Leverage Arel to build dynamic, composable SQL fragments beyond what ActiveRecord relations expose. This lets you integrate raw SQL constructs (CTEs, lateral joins) seamlessly into your Rails codebase.

```ruby
users = User.arel_table
overdue_invoices = Invoice.arel_table

cte = Arel::Nodes::As.new(
  Arel.sql('overdue_invoices'),
  overdue_invoices.project(Arel.star).where(
    overdue_invoices[:due_date].lt(Date.today)
  )
)

query = User.with(cte)
            .joins("JOIN overdue_invoices ON overdue_invoices.user_id = users.id")
            .where(users[:active].eq(true))

User.find_by_sql(query.to_sql)
```