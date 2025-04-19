## 🔑 Implementing Idempotent Jobs with Sidekiq Unique Jobs

To prevent duplicate job execution, integrate the `sidekiq-unique-jobs` gem. It locks jobs with the same arguments until completion, ensuring idempotency for critical operations.

```ruby
# Gemfile
gem 'sidekiq-unique-jobs'

# app/jobs/send_report_job.rb
class SendReportJob
  include Sidekiq::Worker
  sidekiq_options unique: :until_executed,
                  unique_args: ->(args) { ["SendReport", args.first] }

  def perform(user_id)
    # expensive report generation logic
  end
end
```

Configure lock expiry in `config/initializers/sidekiq.rb` to fine‑tune dedupe windows.