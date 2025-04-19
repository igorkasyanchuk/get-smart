## ⚙️ Ensuring Transactional Enqueue

When enqueueing jobs from ActiveRecord callbacks, using `after_commit` guarantees the job is only scheduled once the database transaction succeeds. This prevents orphaned jobs when transactions roll back.

```ruby
# app/models/order.rb
class Order < ApplicationRecord
  after_commit :enqueue_order_processing

  private

  def enqueue_order_processing
    ProcessOrderJob.perform_later(self.id)
  end
end
```

This ensures `ProcessOrderJob` never runs on a failed transaction, preserving data consistency.
