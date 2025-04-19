## 🔒 Idempotency & Deduplication with sidekiq‑unique‑jobs

Prevent duplicate executions by leveraging the `sidekiq-unique-jobs` gem. Configure locks to ensure only one job per unique key is enqueued or executing at any time, and auto‑expire stale locks to avoid deadlocks in rare failure modes.

```ruby
class SyncUserJob
  include Sidekiq::Worker
  sidekiq_options(
    unique: :while_executing,
    lock_expiration: 4.hours,
    queue: :sync
  )

  def perform(user_id)
    user = User.find(user_id)
    ExternalApi.sync(user)
  end
end
```

Lock types:
- `:until_executing` — lock until job begins
- `:while_executing` — lock during execution
- `:until_executed` — lock until execution finishes
