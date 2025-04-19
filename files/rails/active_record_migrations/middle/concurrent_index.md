## 🚀 Add Index Concurrently for Large Tables

For large production tables, adding an index can block writes. Use `disable_ddl_transaction!` and `algorithm: :concurrently` to avoid downtime.

```ruby
class AddIndexOnCreatedAtConcurrently < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :orders, :created_at,
      algorithm: :concurrently,
      name: 'index_orders_on_created_at'
  end
end
```
