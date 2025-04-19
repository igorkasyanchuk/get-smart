## 🔄 Custom Retry & Backoff Strategy

Implement a fine‑tuned retry strategy by overriding `sidekiq_retry_in` and using `sidekiq_retries_exhausted` to handle dead jobs. This approach gives you complete control over retry intervals and custom notification logic when retries are exhausted.

```ruby
class PaymentWorker
  include Sidekiq::Worker
  sidekiq_options retry: 5

  # Exponential backoff: 10s, 30s, 60s, etc.
  sidekiq_retry_in do |count, exception|
    (count**4) + 15
  end

  # Notify when all retries have failed
  sidekiq_retries_exhausted do |msg, ex|
    AlertService.notify("PaymentWorker failed after retries", msg: msg, error: ex)
  end

  def perform(order_id)
    Order.find(order_id).process_payment!
  end
end
```