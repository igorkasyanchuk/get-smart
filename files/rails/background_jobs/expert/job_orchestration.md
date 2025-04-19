## 🔄 Sequential Job Orchestration with ActiveJob Callbacks

Leverage ActiveJob callbacks to construct complex, multi‐step workflows while preserving transactional integrity. Use callbacks like `after_perform_commit`, `before_enqueue`, and `rescue_from` to chain jobs, handle failures, and retry only on successful DB commits.

```ruby
class FirstJob < ApplicationJob
  after_perform_commit :enqueue_second
  rescue_from(StandardError) { |e| ErrorNotifierJob.perform_later(self.job_id, e.message) }

  def perform(record_id)
    record = Record.find(record_id)
    record.process_part_one!  # may raise ActiveRecord::Rollback
  end

  private

  def enqueue_second
    SecondJob.perform_later(record_id)
  end
end

class SecondJob < ApplicationJob
  def perform(record_id)
    Record.find(record_id).process_part_two!
  end
end
```
