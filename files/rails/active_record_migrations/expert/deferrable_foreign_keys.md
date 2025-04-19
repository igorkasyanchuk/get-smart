## 🛠️ Define Deferrable Foreign Keys for Bulk Operations

When loading data in bulk, you may want to defer foreign key checks to the end of the transaction. Use `DEFERRABLE` constraints to improve insert/update performance:

```ruby
class AddDeferrableForeignKeyToOrders < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :orders, :users
    add_foreign_key :orders, :users, deferrable: true, initially_deferred: true
  end
end
```

Now you can insert child records before parents in the same transaction, with validation deferred until commit.