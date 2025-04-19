## 🧹 Purge Unused Blobs and Attachments
Over time, unused blobs can accumulate. Schedule background jobs to purge orphaned blobs and free up storage.

```ruby
# app/jobs/purge_unattached_blobs_job.rb
class PurgeUnattachedBlobsJob < ApplicationJob
  queue_as :low

  def perform
    ActiveStorage::Blob.unattached.find_each do |blob|
      blob.purge_later
    end
  end
end
```

```ruby
# config/schedule.rb (using whenever)
every 1.day do
  runner "PurgeUnattachedBlobsJob.perform_later"
end
```

Using `purge_later` runs deletion in the background to avoid blocking requests. Adjust scheduling to match your retention policy.