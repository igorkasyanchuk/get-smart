## 🔗 Multi-Level Association Caching with Custom Scopes
CounterCulture shines when you need to cache counts through chains of associations, even with custom scopes and conditions. Here’s how to maintain a count of **active** line items across an order’s invoices.

```ruby
# app/models/line_item.rb
class LineItem < ApplicationRecord
  belongs_to :invoice

  scope :active, -> { where(deleted_at: nil) }

  counter_culture :invoice,
    column_name: proc { |li| li.active? ? 'active_items_count' : nil },
    column_names: {
      ['invoices.status = ?', 'paid'] => 'active_items_on_paid_invoices_count'
    },
    column_name_only_on_destroy: { active: 'active_items_count' }

  # propagate counts up to order
  counter_culture :invoice, 
    column_name: 'active_items_count', 
    column_names: {
      ['invoices.order_id IS NOT NULL', ''] => 'order.active_items_count'
    },
    touch: [:invoice, :order]
end

# app/models/invoice.rb
class Invoice < ApplicationRecord
  belongs_to :order, counter_cache: true
  has_many :line_items
end
```

This setup:

1. Uses conditional hash mappings to maintain separate counters based on invoice state.
2. Chains a second counter to propagate from `invoice` to `order`, touching both records.
3. Leverages `column_name_only_on_destroy` to correctly decrement when items are soft-deleted.

Such multi-level, scoped counters help you keep complex aggregates updated without manual SQL or callbacks.