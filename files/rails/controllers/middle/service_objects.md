## 🛠️ Delegate Business Logic to Service Objects
Keep controllers thin by moving complex business logic into service objects. This improves testability and single responsibility. Use a plain Ruby class under `app/services` and call it from your controller action.

```ruby
# app/services/process_order.rb
class ProcessOrder
  def initialize(order)
    @order = order
  end

  def call
    ActiveRecord::Base.transaction do
      charge_payment
      send_confirmation_email
    end
  end

  private

  def charge_payment
    # payment logic
  end

  def send_confirmation_email
    # mailer logic
  end
end

# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save && ProcessOrder.new(@order).call
      redirect_to @order, notice: 'Order processed.'
    else
      render :new
    end
  end
end
```