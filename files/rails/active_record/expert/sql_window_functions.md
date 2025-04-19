## 🎲 SQL Window Functions with ActiveRecord
Use window functions like `ROW_NUMBER()` or `RANK()` directly in ActiveRecord selects to calculate running totals or partitions. This avoids loading excessive records into Ruby.

```ruby
ordered_orders = Order.select(
  'orders.*',
  'ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY created_at DESC) as rn'
)

# Only the most recent order per customer
recent_orders = Order.from(ordered_orders, :sub).where('rn = 1')
```