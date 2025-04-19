## 🧩 Handle nested attributes with `fields_for`
For models that `accepts_nested_attributes_for` child records, use `fields_for` within your form to create or edit associated records. Make sure to permit nested parameters in your controller.

```ruby
# app/models/order.rb
class Order < ApplicationRecord
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true
end
```

```erb
<%= form_with(model: @order) do |form| %>
  <%= form.text_field :customer_name %>
  <%= form.fields_for :items do |item_fields| %>
    <%= item_fields.text_field :product_name %>
    <%= item_fields.number_field :quantity %>
  <% end %>
  <%= form.submit %>
<% end %>
```
