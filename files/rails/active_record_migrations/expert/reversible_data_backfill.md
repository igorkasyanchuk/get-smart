## 🔄 Write Reversible Data-Backfill Migrations

Complex data migrations should be reversible to safely rollback. Use the `reversible` helper to group your `up` and `down` logic in one block:

```ruby
class BackfillUserStatuses < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        User.reset_column_information
        User.where(status: nil).find_each(batch_size: 1_000) do |user|
          user.update_columns(status: user.sign_in_count.positive? ? 'active' : 'inactive')
        end
      end

      dir.down do
        User.update_all(status: nil)
      end
    end
  end
end
```

This pattern keeps your schema and data changes tightly coupled and reversible.