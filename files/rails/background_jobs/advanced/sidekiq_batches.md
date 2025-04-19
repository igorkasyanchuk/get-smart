## 📦 Grouping Jobs with Sidekiq Batches and Callbacks

Sidekiq Pro's Batches allow coordination of many jobs and execute callbacks when the group finishes. Use them to orchestrate workflows across multiple worker classes.

```ruby
# app/services/data_import_service.rb
class DataImportService
  def import_all(records)
    batch = Sidekiq::Batch.new
    batch.description = 'Importing CSV rows'
    batch.on(:success, ImportCallback)

    batch.jobs do
      records.each { |row| ImportRowJob.perform_async(row.to_h) }
    end
  end
end

# app/workers/import_callback.rb
class ImportCallback
  def on_success(status, options)
    ReportsMailer.import_finished.deliver_now
  end
end
```

This yields atomic workflows, notifying you when all `ImportRowJob` instances complete.