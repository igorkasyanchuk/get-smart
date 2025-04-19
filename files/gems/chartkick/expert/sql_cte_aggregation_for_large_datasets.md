## ⚡ High-Performance Aggregation via SQL CTEs
When dealing with millions of rows, offload heavy grouping and window functions to your database using Common Table Expressions (CTEs). This minimizes Ruby overhead and exploits DB indexes and parallelism.

```ruby
# app/models/order.rb
def self.monthly_revenue
  with_monthly AS (
    select(
      "DATE_TRUNC('month', created_at) AS month",
      'SUM(amount) AS total'
    ).from('orders').group('1')
  )
  .from('monthly as m').with(with_monthly: 'SELECT * FROM monthly')
  .pluck('to_char(month, '"'YYYY-MM'"')', 'total')
end
```

In your controller/view, feed directly to Chartkick without further processing:

```erb
<%= line_chart Order.monthly_revenue, points: false, library: { animation: { duration: 1500 } } %>
```