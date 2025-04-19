## 🛠 Dependency Injection for Service Objects in Controllers

Promote testability by injecting service dependencies into controllers rather than hard‐coding them. Use controller attributes or initializer injection to swap implementations during tests or compose different behaviors.

```ruby
class OrdersController < ApplicationController
  def initialize(order_creator: OrderCreator.new)
    @order_creator = order_creator
    super()
  end

  def create
    order = @order_creator.call(order_params)
    render json: order, status: :created
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity)
  end
end

# In tests
OrdersController.new(order_creator: MockOrderCreator.new)
```