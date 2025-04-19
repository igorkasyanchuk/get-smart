## 🆕 Add Columns with Default and NOT NULL

When adding a new column to a large table, combining a default value with a NOT NULL constraint ensures existing rows are updated atomically and simplifies future queries. You can add the column with a default and null allowance, backfill data, then enforce NOT NULL in a separate step.

```ruby
class AddStatusToOrders < ActiveRecord::Migration[6.1]
  def up
    add_column :orders, :status, :string, default: "pending", null: true
    Order.update_all(status: "pending")
    change_column_null :orders, :status, false
  end

  def down
    remove_column :orders, :status
  end
end
```
