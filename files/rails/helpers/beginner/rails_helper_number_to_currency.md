## 💰 Tip: Format currency with `number_to_currency`
The `number_to_currency` helper converts a numeric value to a formatted currency string based on your locale. You can customize the currency unit, precision, and delimiter options.

```erb
<%= number_to_currency @product.price, unit: '$', precision: 2 %>
```

This outputs a string like `$19.99`, making pricing display consistent across your app.