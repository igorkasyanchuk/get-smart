## 📦 Batch Data Migration in Migrations

When backfilling large datasets, use `find_in_batches` to avoid loading all records into memory and reduce locks. This pattern prevents timeouts.

```ruby
class BackfillUserStatuses < ActiveRecord::Migration[6.1]
  def up
    User.find_in_batches(batch_size: 1000) do |batch|
      batch.each { |u| u.update_column(:status, 'active') if u.status.nil? }
    end
  end

  def down
    # no-op or leave blank
  end
end
```
