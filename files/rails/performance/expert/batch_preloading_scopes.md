## 🔄 Efficient Batching with find_in_batches & preload

Blend `find_in_batches` with `preload` to process vast datasets in chunks while avoiding N+1 queries on associations. This is ideal for background jobs that resync or export data.

```ruby
class SyncJob < ApplicationJob
  queue_as :low

  def perform
    User.where(active: true).find_in_batches(batch_size: 5_000) do |users_batch|
      User.preload(:orders, :profile).where(id: users_batch.map(&:id)).each do |user|
        ExternalApi.push(user, user.orders, user.profile)
      end
    end
  end
end
```

This pattern ensures each batch issues exactly two queries regardless of batch size and association count.