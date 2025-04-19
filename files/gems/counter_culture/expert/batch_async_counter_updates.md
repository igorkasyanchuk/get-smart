## 🔄 Using Batch Asynchronous Counter Updates with Sidekiq
When you have high write volume, synchronous counter updates can become a bottleneck. CounterCulture’s `async: true` mode lets you push counter adjustments into a background queue, batching multiple increments into a single DB write for each owner. This reduces lock contention and speeds up your user-facing requests.

```ruby
# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post

  counter_culture :post,
    column_name: proc { |model| model.approved? ? 'approved_comments_count' : nil },
    delta_column: "approved? ? 1 : 0",
    touch: true,
    async: ->(callback) { CounterCultureJob.perform_later(callback) }
end

# app/jobs/counter_culture_job.rb
class CounterCultureJob < ApplicationJob
  queue_as :counter_culture

  def perform(callback)
    CounterCulture::Counter.new.call(callback)
  end
end
```

By overriding the default job, you can wrap multiple callbacks in a single Sidekiq batch or customize retries. Combine this with `CounterCulture::BackgroundJob.batch_size` to tune how many operations get grouped per batch.