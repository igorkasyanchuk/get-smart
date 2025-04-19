## ⚖️ Weighted Counter Updates with `delta_magnitude`

By default, CounterCulture adds or subtracts one per record change. For scenarios where you need to sum a numeric field (e.g., quantity or price), use the `delta_magnitude` option. This computes the delta dynamically on create, update, and destroy actions.

```ruby
# app/models/line_item.rb
class LineItem < ApplicationRecord
  belongs_to :order

  # Instead of +1, add the quantity of each line item to order.items_count
  counter_culture :order,
    column_name: 'items_count',
    delta_magnitude: ->(line_item) { line_item.quantity }
end

# Run backfill to correct existing orders
LineItem.counter_culture_fix_counts
```

Here, whenever a `LineItem` is created, updated, or destroyed, the `order.items_count` will change by the line item's `quantity`, accurately reflecting total items rather than just record count.