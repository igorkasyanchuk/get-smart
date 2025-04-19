## 🔒 Ensuring Unique Jobs with sidekiq-unique-jobs

Avoid duplicate job enqueues by leveraging `sidekiq-unique-jobs`. This gem provides various lock strategies (`until_executed`, `while_executing`, etc.) to guarantee idempotency at enqueue or runtime.

```ruby
# Gemfile
gem 'sidekiq-unique-jobs', '~> 7.1'

# app/workers/data_sync_worker.rb
class DataSyncWorker
  include Sidekiq::Worker

  sidekiq_options unique: :until_executed,
                  unique_args: ->(args) { [args.first['record_id']] },
                  lock_expiration: 2.hours

  def perform(record_id)
    RecordSyncService.new(record_id).sync!
  end
end

# config/initializers/sidekiq.rb
SidekiqUniqueJobs.configure do |config|
  config.lock_info = true  # log lock acquisition/release details
end
```