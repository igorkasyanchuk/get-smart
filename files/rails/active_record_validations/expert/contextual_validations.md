## 🎭 Contextual Validations with validation_context
Use `valid?(:context_name)` and `on: :context_name` to run specific validations in different flows (e.g., signup vs. update). This keeps disparate validation rules isolated and prevents conditional sprawl in your models.

```ruby
# app/models/order.rb
class Order < ApplicationRecord
  validates :credit_card_number, presence: true, on: :purchase
  validates :billing_address, presence: true, if: -> { shipping_differs? }
end

# In controller
def purchase
  @order = Order.new(order_params)
  if @order.valid?(:purchase)
    @order.save
  else
    render_errors(@order)
  end
end
```