## 🎨 Partial Rendering with Locals
Using partials with locals lets you reuse view snippets while passing in only the data you need. This reduces duplication and makes your views easier to test and maintain. Use the `locals` option to inject variables into the partial scope.

```erb
<%= render partial: "products/product_card", locals: { product: @product, show_price: true } %>
```

In `_product_card.html.erb`:

```erb
<div class="card">
  <h3><%= product.name %></h3>
  <% if show_price %>
    <p>Price: <%= number_to_currency(product.price) %></p>
  <% end %>
</div>
```