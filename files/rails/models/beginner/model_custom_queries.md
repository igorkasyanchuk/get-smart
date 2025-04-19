## 📦 Adding Custom Query Methods

Define class methods for complex queries that don’t fit a single scope. This keeps your code organized and readable.

```ruby
class Product < ApplicationRecord
  def self.top_sellers(limit = 5)
    select('products.*, SUM(order_items.quantity) AS total_sold')
      .joins(:order_items)
      .group('products.id')
      .order('total_sold DESC')
      .limit(limit)
  end
end

# Usage:
Product.top_sellers(10)
```