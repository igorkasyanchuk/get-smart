## 🔄 Dynamic Partial Resolution Based on State

Implement dynamic partial lookup to render different templates for an object’s state without conditionals. Build your path string at runtime and let Rails pick the right partial. This pattern scales elegantly as new states or types appear.

```erb
<%# in views/orders/index.html.erb %>
<% @orders.each do |order| %>
  <%= render "orders/status/#{order.status}", order: order %>
<% end %>
```

```erb
<%# in views/orders/status/shipped.html.erb %>
<div class="order shipped">Shipped on <%= order.shipped_at.to_date %></div>
```