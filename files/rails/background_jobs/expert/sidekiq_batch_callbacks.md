## 📦 High‑Throughput Batch Processing with Sidekiq::Batch

When you need to launch hundreds or thousands of jobs as a unit and track completion, Sidekiq Pro’s `Batch` API is indispensable. You can attach callbacks for success, death, or custom events to execute cleanup or next‐phase tasks once the batch completes.

```ruby
batch = Sidekiq::Batch.new
batch.description = "Bulk user data refresh"
batch.on(:success, 'BatchCallback#on_success', { report_id: 42 })

batch.jobs do
  User.find_in_batches(batch_size: 1000) do |group|
    RefreshUserJob.perform_async(group.map(&:id))
  end
end

# app/workers/batch_callback.rb
class BatchCallback
  def self.on_success(status, options)
    ReportMailer.batch_finished(options[:report_id], status.total).deliver_now
  end
end
```
