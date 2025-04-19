## 🔄 Customize Retry Strategies with sidekiq_retry_in
By default Sidekiq uses an exponential backoff for retries, but you can override this per worker to suit business needs. Define a `sidekiq_retry_in` block to control the delay for each retry attempt.

```ruby
class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: 5  # maximum 5 retries

  # Customize retry intervals (in seconds)
  sidekiq_retry_in do |count|
    case count
    when 0 then 30     # 30s after first failure
    when 1 then 5.minutes
    when 2 then 30.minutes
    else 1.hour * count
    end
  end

  def perform(recipient_id)
    # send email logic
  end
end
```
