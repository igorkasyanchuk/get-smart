## 🏷️ Partial Indexing via Migrations
Define conditional indexes in migrations to speed up queries on large tables with sparse active records. Particularly useful for soft-deletion or status flags.

```ruby
class AddPartialIndexToOrders < ActiveRecord::Migration[6.1]
  def change
    add_index :orders, :user_id,
      where: "status = 'active'",
      name: 'idx_active_orders_on_user_id'
  end
end
```