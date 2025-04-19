## 📦 Using Subqueries with `from`

Active Record supports subqueries as sources via the `from` method. This is useful for complex aggregations or derived tables without writing raw SQL.

```ruby
# Build a subquery for user order counts
subquery = Order.select('user_id, COUNT(*) AS order_count').group(:user_id)
# Use it as a source to find heavy users
analytics = User.from(subquery, :user_orders)
                 .where('order_count > ?', 10)
```