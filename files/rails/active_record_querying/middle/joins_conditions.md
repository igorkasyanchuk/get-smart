## 💡 Joining Tables with `joins` and Conditions

`joins` performs an SQL `INNER JOIN` on associations, allowing you to filter based on associated table columns. Unlike `includes`, it doesn't eager load associated objects.

```ruby
# Users who have placed orders over $10
users = User.joins(:orders)
            .where(orders: { total_cents: 1000..Float::INFINITY })
```