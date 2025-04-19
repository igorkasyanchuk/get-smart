## 🔍 Turbo Stream with Complex CSS Selectors
Turbo Streams support targeting elements via CSS selectors, enabling updates to deeply nested or dynamic components. Use the `target` attribute to match classes, IDs, or attribute selectors for precise DOM manipulation.

```erb
<turbo-stream action="replace" target=".cart-item[data-item-id='#{item.id}'] .price">
  <template><%= number_to_currency(item.price) %></template>
</turbo-stream>
```

This allows you to update only the price span in a specific cart item without re-rendering the entire cart, optimizing both network payload and DOM operations.