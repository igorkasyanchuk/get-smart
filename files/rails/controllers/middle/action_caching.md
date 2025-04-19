## 🚀 Leverage Action Caching
Action caching preserves entire controller responses to speed up repeat requests. Only hit your application code when cache is expired, which is ideal for semi-static pages. Set up caching in your controller and configure expiration.

```ruby
class ProductsController < ApplicationController
  caches_action :index, expires_in: 10.minutes

  def index
    @products = Product.all
  end
end

# Ensure you have configured a cache store, e.g., Redis:
# config/environments/production.rb
# config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'
```