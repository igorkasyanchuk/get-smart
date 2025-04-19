## 🛠 Excluding Records with `where.not`

Instead of retrieving all records and filtering in Ruby, use `where.not` to exclude records at the database level. This translates to a `NOT IN` or `!=` clause, reducing data transferred.

```ruby
# Exclude canceled orders
active_orders = Order.where.not(status: 'canceled')
```