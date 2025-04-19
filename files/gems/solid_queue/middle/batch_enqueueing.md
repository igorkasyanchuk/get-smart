## 📦 Batch Enqueuing Jobs

Grouping related jobs in a single batch reduces network chatter and ensures atomic dispatch. Use `Solid::Queue.batch` to bundle multiple `enqueue` calls into one request.

```ruby
Solid::Queue.batch do |batch|
  users = User.where(active: true).pluck(:id)
  users.each do |user_id|
    batch.enqueue(EmailWorker, args: {user_id: user_id})
  end
  batch.enqueue(DailyReportWorker, args: {date: Date.today})
end
```

All jobs inside the block are sent together when the block finishes. This is ideal for bulk notifications or analytics tasks.