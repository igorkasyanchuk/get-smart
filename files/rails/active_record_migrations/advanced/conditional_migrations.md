## 🔍 Write Conditional Migrations

Make migrations idempotent by checking schema objects before creating or dropping them. Use methods like `table_exists?`, `column_exists?`, `index_name_exists?` to guard statements. This ensures safe reruns in different environments.

```ruby
class AddArchivedColumnIfNeeded < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:projects, :archived)
      add_column :projects, :archived, :boolean, default: false, null: false
    end
  end
end
```