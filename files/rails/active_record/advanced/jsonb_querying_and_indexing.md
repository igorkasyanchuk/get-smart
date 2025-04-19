## 🎯 JSONB Querying and Indexing

Use PostgreSQL’s `JSONB` columns with GIN indexes to store schemaless data while maintaining query performance. Leverage ActiveRecord’s built‑in JSON query methods.

```ruby
class Product < ApplicationRecord; end

# Migration:
# add_column :products, :metadata, :jsonb, default: {}
# add_index  :products, :metadata, using: :gin

# Query nested JSON keys:
products = Product.where("metadata ->> 'color' = ?", 'red')
```