## 📦 Namespacing to Avoid Constant Collisions

Using modules as namespaces prevents constant clashes across your codebase. Wrap related classes and submodules inside a top-level module to group functionality and maintain clarity.

```ruby
module Ecommerce
  class Product; end
  class Order; end

  module Utils
    def self.format_price(amount)
      sprintf("$%.2f", amount)
    end
  end
end

Ecommerce::Utils.format_price(19.99)
# => "$19.99"
```