## 🚀 Basic Feature Toggle Usage
Once Flipper is set up, you can define, enable, and check features in your application code. This is the core of feature flagging.

```ruby
# Enable a feature globally:
$flipper.enable(:new_checkout)

# Disable a feature:
$flipper.disable(:new_checkout)

# Conditionally render code based on the flag:
if $flipper.enabled?(:new_checkout)
  # Render the new checkout page
  render 'new_checkout'
else
  # Fallback to the old page
  render 'checkout'
end

# Check within Rails controller or view:
# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def show
    if $flipper.enabled?(:new_checkout, current_user)
      @checkout_path = new_user_checkout_path(current_user)
    else
      @checkout_path = user_checkout_path(current_user)
    end
  end
end
```