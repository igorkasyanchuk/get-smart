## 🏠 Set the root route for your application

The `root` method defines what page users see at `/`. It’s typically your home or dashboard page. Placing it at the top of `routes.rb` makes it easy to spot.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  root 'home#index'
  # other routes...
end
```

After restarting the server, navigating to `http://localhost:3000/` will invoke `HomeController#index`.