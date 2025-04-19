## 🗑️ Remove Columns and Indexes Together

To avoid orphaned indexes, always remove associated indexes first, then drop the column. In Rails 5+, dropping the column also drops related indexes automatically, but explicit removal improves clarity.

```ruby
class RemoveLegacyFieldsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_index :accounts, :legacy_id if index_exists?(:accounts, :legacy_id)
    remove_column :accounts, :legacy_id, :string
  end
end
```
