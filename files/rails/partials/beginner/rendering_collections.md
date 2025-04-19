## 🔁 Rendering Collections
Render a collection of objects with one call to `render`, which loops over each item and sets a local within the partial.

```erb
<!-- app/views/products/index.html.erb -->
<%= render partial: "product", collection: @products, as: :item %>
```

This will render `app/views/products/_product.html.erb` for each `item` in `@products`. Inside the partial, refer to each object as `item`.