## 📋 Generating dropdowns with `select`
Use `select` to present a list of options for a form attribute. It can take an array of pairs or a collection of Active Record objects. The helper links the selected value to your model attribute.

```ruby
<%= form_with model: @order, local: true do |f| %>
  <%= f.label :status %>
  <%= f.select :status, Order.statuses.keys.map { |s| [s.humanize, s] }, prompt: "Choose status" %>
<% end %>
```
