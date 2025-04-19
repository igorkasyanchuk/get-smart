## 🧹 Clearing Cache in `after_save`
If you cache model data for performance, use `after_save` to expire or refresh caches when records change. This keeps your cache in sync with the database.

```ruby
class Product < ApplicationRecord
  after_save :expire_product_cache

  private

  def expire_product_cache
    Rails.cache.delete("product_#{id}")
  end
end
```

Every time a product is saved, its cache key is cleared so consumers will fetch updated data.