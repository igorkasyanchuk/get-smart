## 🗃️ Efficient Collection Partial Caching
Rails can automatically cache each item in a collection when rendering a partial with `cached: true`, dramatically reducing view rendering time for large lists. Use `render` with the `collection` and `cached: true` options so that each element is cached by its model cache key. When any item changes, Rails will expire only that fragment instead of re-rendering the entire list.

```erb
<%# app/views/products/index.html.erb %>
<%= render partial: 'products/product', collection: @products, cached: true %>
```

```erb
<%# app/views/products/_product.html.erb %>
<div class="product" id="product-<%= product.id %>">
  <h2><%= product.name %></h2>
  <p><%= product.description.truncate(100) %></p>
</div>
```