## 🔄 Orchestrating Multiple Frames from a Single Response
Combine multiple Turbo Streams in one response to coordinate complex UI changes across frames atomically. This ensures consistency when updating dependent components.

```erb
<%= turbo_stream.replace "cart-header" do %>
  <div><%= @cart.items.count %> items</div>
<% end %>
<%= turbo_stream.replace "cart-total" do %>
  <div>Total: <%= number_to_currency(@cart.total) %></div>
<% end %>
```