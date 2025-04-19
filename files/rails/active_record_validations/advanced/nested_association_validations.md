## 📦 Validating Nested Associations Automatically

When using `accepts_nested_attributes_for`, combine it with `validates_associated` (or rely on `autosave: true`) to ensure child records are valid before saving the parent.

```ruby
class Invoice < ApplicationRecord
  has_many :line_items, autosave: true
  accepts_nested_attributes_for :line_items
  validates_associated :line_items
end

class LineItem < ApplicationRecord
  belongs_to :invoice
  validates :amount, numericality: { greater_than: 0 }
end

# Controller
Invoice.create(invoice_params) # fails if any line_item is invalid
```