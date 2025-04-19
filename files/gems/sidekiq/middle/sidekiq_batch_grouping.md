## 📦 Group Jobs with sidekiq-batch for Callbacks
When you need a callback after a group of jobs completes, the `sidekiq-batch` gem provides batch tracking. Create a batch, push jobs into it, and define success/error callbacks.

```ruby
# Gemfile
gem 'sidekiq-batch'

# Usage in code
batch = Sidekiq::Batch.new
batch.description = "Process user imports"
batch.on(:complete, ImportBatchCallback, { batch_id: nil })

batch.jobs do
  users.each do |user|
    ImportWorker.perform_async(user.id)
  end
end

# Callback handler
class ImportBatchCallback
  def on_complete(status, options)
    # all ImportWorker jobs finished successfully
    AdminNotifier.notify_batch_finished(options['batch_id'])
  end
end
```
