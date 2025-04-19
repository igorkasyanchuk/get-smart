## 🏹 Perform Batch Updates Efficiently with `find_in_batches`

Updating millions of rows in a single transaction can exhaust memory or lock tables for too long. Use `find_in_batches` with small batches:

```ruby
class NormalizeTimestampsInLogs < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    Log.find_in_batches(batch_size: 5_000) do |batch|
      ids = batch.map(&:id)
      execute <<-SQL
        UPDATE logs
        SET created_at = created_at AT TIME ZONE 'UTC'
        WHERE id IN (#{ids.join(',')});
      SQL
    end
  end

  def down
    # no-op or reverse logic
  end
end
```

This pattern avoids huge transactions and gracefully handles large data sets.