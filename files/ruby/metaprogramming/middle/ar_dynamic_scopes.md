## 🔍 Dynamic ActiveRecord Scopes

Define ActiveRecord scopes based on runtime conditions, reducing repetitive code. Use metaprogramming in your model to generate scopes for each field.

```ruby
class Product < ApplicationRecord
  %i[category price stock].each do |field|
    scope "by_#{field}", ->(val) { where(field => val) }
  end
end

# Usage:
Product.by_category('books')
Product.by_price(9.99)
```