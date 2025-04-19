## 🔄 Add Cascading Foreign Keys

Enforce referential integrity by adding foreign keys with `ON DELETE`/`ON UPDATE` actions. Rails migrations support the `:on_delete` and `:on_update` options. This helps avoid orphaned records and manual cleanup.

```ruby
class AddCommentUserForeignKeyWithCascade < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :comments, :users, on_delete: :cascade, on_update: :cascade
  end
end
```