## 🛠️ Custom Cache Versioning Strategies

Implement custom `cache_version` methods on models to finely control when fragments expire beyond timestamp changes. This is handy when your model depends on external data or multi-table aggregates.

```ruby
# app/models/product.rb
class Product < ApplicationRecord
  has_many :prices

  def cache_version
    # Combine record updated_at with associated prices max updated_at
    [updated_at, prices.maximum(:updated_at)].compact.max
  end
end
```

```erb
<%= cache [@product, @product.cache_version] do %>
  <!-- heavy product view -->
<% end %>
```

Whenever a price changes, `cache_version` changes, invalidating only the product fragment without touching unrelated caches.