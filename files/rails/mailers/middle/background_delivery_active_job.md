## 🚀 Send Emails Asynchronously with Active Job

Avoid blocking your request-response cycle by sending emails in the background. Use `deliver_later` to enqueue email delivery through Active Job adapters like Sidekiq or Resque.

```ruby
# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def create
    @order = Order.create(order_params)
    OrderMailer.confirmation(@order).deliver_later(queue: :mailers)
    redirect_to @order, notice: 'Order placed. Confirmation email is on its way!'
  end
end
```

Configure your queue adapter in `config/environments/production.rb`:

```ruby
config.active_job.queue_adapter = :sidekiq
```