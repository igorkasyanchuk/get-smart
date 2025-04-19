## ⏰ Schedule Future or Recurring Jobs

Active Job supports scheduling jobs to run at a later time using the `set` helper. For cron-like recurring tasks, combine Active Job with gems like `sidekiq-scheduler` or Rails’ own `ActiveSupport::Cron` integrations.

```ruby
# Enqueue a job 1 hour later
ReportGenerationJob.set(wait: 1.hour).perform_later(report.id)
```

```yaml
# config/sidekiq_scheduler.yml
daily_report:
  cron: "0 2 * * *"
  class: "DailyReportJob"
  queue: default
```