## 🔄 Define Member vs Collection Routes Clearly
Use `member` for routes acting on a specific resource and `collection` for those on the whole set. This distinction keeps your URL semantics correct and helpers intuitive.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :orders do
    member do
      post :cancel    # /orders/:id/cancel
    end

    collection do
      get :recent     # /orders/recent
    end
  end
end
```

Now you can call `cancel_order_path(order)` and `recent_orders_path`, making your intentions explicit.