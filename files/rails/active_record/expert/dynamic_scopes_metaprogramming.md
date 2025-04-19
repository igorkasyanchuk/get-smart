## 🛠️ Runtime-Generated Scopes with Metaprogramming
Dynamically define scopes based on external config, enabling plug-and-play filtering without code changes. Leverage `scope` within `class_eval`.

```ruby
filters = { by_status: :status, by_category: :category_id }

filters.each do |name, column|
  Product.class_eval do
    scope name, ->(val) { where(column => val) if val.present? }
  end
end

# Usage
today_products = Product.by_status('available')
```