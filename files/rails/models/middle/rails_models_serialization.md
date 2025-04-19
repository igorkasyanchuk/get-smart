## 🗄️ Serialize Attributes for Flexible Data

Use `serialize` for storing structured data (like hashes or arrays) in a single text column. This is handy for settings or metadata without creating extra tables. For more advanced usage, consider JSON columns with native querying support in PostgreSQL.

```ruby
class Product < ApplicationRecord
  serialize :properties, Hash
end

# Usage:
product = Product.create(name: 'Widget', properties: { color: 'blue', weight: '200g' })
product.properties[:color] # => "blue"
```