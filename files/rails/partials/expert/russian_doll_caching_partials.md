## 🗄️ Russian Doll Caching in Nested Partials

Leverage Rails’ native fragment caching to drastically reduce redundant view rendering by wrapping parent and child partials in nested cache blocks. By using the `cached: true` flag on collection renders, Rails will generate & expire fragments for each record, avoiding a full re‐render when only a subset changes.

```erb
<% cache @category do %>
  <h1><%= @category.name %></h1>
  <%= render partial: 'products/product', collection: @category.products, as: :product, cached: true %>
<% end %>
```