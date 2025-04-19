## 🛠️ Error Handling & Retry Strategies

Solid Queue provides built‑in retry controls and failure callbacks. Use `max_retries` and `retry_delay` to tune retry logic, and `on_failure` to hook into error notifications.

```ruby
class BillingWorker
  include Solid::Queue::Worker

  max_retries 5
  retry_delay ->(attempt) { attempt * 30 }  # backoff: 30s, 60s, 90s...

  on_failure do |error, job|
    ErrorNotifier.notify(error, job_id: job.id, clazz: job.klass)
  end

  def perform(invoice_id)
    BillingService.process(invoice_id)
  end
end

# Enqueue a billing job
Solid::Queue.enqueue(BillingWorker, args: {invoice_id: 123})
```