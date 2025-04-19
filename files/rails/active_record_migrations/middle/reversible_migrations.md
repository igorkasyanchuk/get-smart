## 📑 Use Reversible Migrations

`reversible` blocks let Rails infer the `down` operation for simple changes, keeping migrations DRY. Use it for operations like adding columns or indexes where Rails knows the inverse.

```ruby
class AddPublishedAtToPosts < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up   { add_column :posts, :published_at, :datetime }
      dir.down { remove_column :posts, :published_at }
    end
  end
end
```
