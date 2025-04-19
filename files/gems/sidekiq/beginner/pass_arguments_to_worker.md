## 📦 Pass Arguments and Options to Workers

Sidekiq supports passing simple Ruby objects (strings, numbers, arrays, hashes) as arguments. You can also set retries and queue names via options.

```ruby
# app/workers/report_worker.rb
class ReportWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'reports', retry: 5

  # args: report_id (Integer)
  def perform(report_id)
    report = Report.find(report_id)
    report.generate_pdf!
  end
end
```

```ruby
# Enqueue with custom queue and retry settings
ReportWorker.perform_async(42)
```