## 📝 Profile ActiveRecord Queries with `explain`

When performance issues arise, `explain` reveals the SQL execution plan directly from your Rails console or code. This shows how indexes are used, join strategies, and potential bottlenecks. Integrate `explain` calls inline or log them to quickly diagnose slow queries.

```ruby
# Rails console
User.joins(:orders).where(orders: {status: 'pending'}).explain

# In code
records = Product.where(active: true)
Rails.logger.info(records.explain)
```

Examine the output to spot full-table scans or missing indexes, then adjust your schema or queries accordingly.