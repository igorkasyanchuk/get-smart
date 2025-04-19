## 🔗 Validating Complex Associations
Validate nested and deeply associated records by using `validates_associated` with `inverse_of`, ensuring full object graph integrity. Combine with `reject_if` and custom proc logic to conditionally build children.

```ruby
# app/models/order.rb
class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order
  accepts_nested_attributes_for :line_items, reject_if: ->(attrs) { attrs['quantity'].to_i.zero? }
  validates_associated :line_items
end

# app/models/line_item.rb
class LineItem < ApplicationRecord
  belongs_to :order, inverse_of: :line_items
  validates :quantity, numericality: { greater_than: 0 }
end
```