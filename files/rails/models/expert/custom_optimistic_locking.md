## 🦄 Customize Optimistic Locking Column
By default, Rails uses a `lock_version` column. You can override it to use custom naming or multiple locks across different concerns. This is helpful when you have versioned fields in the same table.

```ruby
class Product < ApplicationRecord
  self.locking_column = :inventory_version
end

# Schema:
# t.integer :inventory_version, default: 0, null: false
```

Now ActiveRecord will increment `inventory_version` on update and raise `ActiveRecord::StaleObjectError` if another transaction updated the same record first.