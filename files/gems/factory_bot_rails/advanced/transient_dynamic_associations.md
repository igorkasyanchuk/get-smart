## ⚙️ Transient Attributes for Dynamic Associations

Transient attributes let you pass ephemeral values into a factory without persisting them to the model. Combine these with `after(:create)` hooks to dynamically create or modify associated records based on test parameters.

```ruby
factory :order do
  customer
  total { 100 }

  transient do
    line_item_count { 3 }
  end

  after(:create) do |order, evaluator|
    create_list(:line_item, evaluator.line_item_count, order: order)
  end
end

# In your spec:
let(:big_order) { create(:order, line_item_count: 10, total: 500) }
expect(big_order.line_items.size).to eq(10)
```