## ⚙️ Conditional Fragment Caching

Sometimes you only want to cache fragments if a certain condition is met. You can pass an `if` or `unless` option to the `cache` helper to skip caching under specific conditions.

```erb
<%# app/views/products/show.html.erb %>
<% cache(product, if: -> { product.reviews_count > 0 }) do %>
  <h1><%= product.name %></h1>
  <p>Reviews: <%= product.reviews_count %></p>
<% end %>
```