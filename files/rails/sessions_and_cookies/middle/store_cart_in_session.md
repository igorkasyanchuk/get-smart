## 🛒 Store Shopping Cart in Session

Storing lightweight shopping cart data in the session helps you persist user selections across requests without hitting the database for each action. Use a hash or array to track product IDs and quantities, and remember to avoid storing bulky objects directly. You can initialize the cart in a `before_action` and manipulate it in controller actions.

```ruby
class CartsController < ApplicationController
  before_action :initialize_cart

  def add
    product_id = params[:product_id].to_s
    session[:cart][product_id] = (session[:cart][product_id] || 0) + 1
    redirect_to cart_path, notice: "Added to cart!"
  end

  private

  def initialize_cart
    session[:cart] ||= {}
  end
end
```