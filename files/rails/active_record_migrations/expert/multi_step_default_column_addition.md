## 💼 Add Columns with Defaults in Multiple Steps to Avoid Table Rewrites

Adding a non-null column with a default will rewrite the entire table. To avoid locks, split into three migrations:

```ruby
class AddActiveToUsersStep1 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active, :boolean
  end
end

class BackfillActiveForUsersStep2 < ActiveRecord::Migration[6.1]
  def up
    User.reset_column_information
    User.update_all(active: true)
  end
  def down; end
end

class AddDefaultAndNotNullToActiveStep3 < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :active, from: nil, to: true
    change_column_null :users, :active, false
  end
end
```

This approach ensures zero-downtime schema changes on large tables.