## 🗃️ Advanced JSONB Queries in PostgreSQL
Leverage PostgreSQL’s JSONB operators via ActiveRecord to filter and index semi-structured data. You can use `where` with `?` or `@>` operators, and combine GIN indexes for lightning-fast lookups on JSONB columns.

```ruby
class Product < ApplicationRecord
  scope :with_spec, ->(key, value) {
    where("specs ->> ? = ?", key.to_s, value.to_s)
  }
end

# Usage
durable_products = Product.with_spec(:material, 'steel')
```

Adding a GIN index on `specs` (`add_index :products, :specs, using: :gin`) ensures these queries stay performant at scale.