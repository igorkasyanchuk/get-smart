## 📬 Parameterized Mailers with Strong Typing
Craft mailers that accept keyword arguments and leverage `ActionMailer::Parameters` for typecasting and validation. This enhances maintainability by ensuring your mailer payloads follow a strict contract.

```ruby
# app/mailers/order_mailer.rb
class OrderMailer < ApplicationMailer
  parameter :order_id, type: Integer, required: true
  parameter :notify_admin, type: :boolean, default: false

  def receipt
    @order = Order.find(order_id)
    mail(
      to: @order.user.email,
      subject: notify_admin ? 'New Order Placed' : 'Your Receipt'
    )
  end
end

# Invocation with safe parameters
OrderMailer.with(order_id: 42, notify_admin: true).receipt.deliver_later
```