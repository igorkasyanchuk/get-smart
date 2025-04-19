## 🗂️ Orchestrating Jobs with Sidekiq Batches

Use Sidekiq Pro batches to execute complex, multi‑step workflows with success and death callbacks. Batches let you group jobs and define callbacks that run once all jobs in the batch have finished or if any job dies.

```ruby
class ReportGenerationService
  def call(user_id)
    batch = Sidekiq::Batch.new
    batch.description = "Generate reports for user #{user_id}"
    batch.on(:complete, ReportCallbacks, { user_id: user_id })
    batch.on(:death, ReportCallbacks,    { user_id: user_id })

    batch.jobs do
      # Distribute work across shards
      5.times { |i| ReportWorker.perform_async(user_id, shard: i) }
    end
  end
end

class ReportCallbacks
  def on_complete(status, options)
    UserMailer.with(id: options['user_id']).reports_ready.deliver_later
  end

  def on_death(status, options)
    UserMailer.with(id: options['user_id']).report_failed.deliver_later
  end
end
```