## ⚙️ Configure Retries and Discards

Active Job lets you specify retry and discard strategies per exception type. Use `retry_on` and `discard_on` in your job class to handle transient errors gracefully without crashing your app.

```ruby
# app/jobs/payment_processing_job.rb
class PaymentProcessingJob < ApplicationJob
  queue_as :billing

  retry_on Net::OpenTimeout, wait: 10.seconds, attempts: 5
  discard_on ActiveRecord::RecordNotFound

  def perform(order_id)
    order = Order.find(order_id)
    PaymentGateway.charge(order)
  end
end
```