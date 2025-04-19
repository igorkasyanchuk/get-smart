## 🎯 Eager Load with Custom Select and Aliases

Override eager loading to select only required columns and avoid data duplication. This approach reduces memory overhead when working with large associations.

```ruby
class Order < ApplicationRecord
  has_many :line_items

  def self.with_minimal_customer_and_items
    eager_load(:customer, :line_items)
      .select(
        'orders.id, orders.total,c.id AS customer_id, c.name AS customer_name',
        'line_items.id AS item_id, line_items.quantity'
      )
      .joins(:customer)
  end
end
```
