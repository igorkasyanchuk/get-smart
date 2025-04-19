## 🎯 Use Anonymous Models to Decouple Future Schema Changes

Referencing your app models in migrations can break when the model changes. Define lightweight, anonymous AR classes within migrations to shield from future code changes:

```ruby
class BackfillProductCategory < ActiveRecord::Migration[6.1]
  class MigrationProduct < ApplicationRecord
    self.table_name = 'products'
  end

  def up
    MigrationProduct.where(category: nil).update_all(category: 'uncategorized')
  end

  def down
    MigrationProduct.where(category: 'uncategorized').update_all(category: nil)
  end
end
```

This ensures your migration logic remains stable even if `Product` evolves.