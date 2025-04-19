## 💰 Formatting Numbers with `number_to_*` Helpers

Rails provides a suite of helpers for number formatting like `number_to_currency`, `number_with_delimiter`, and more. They help present numbers in a user-friendly way.

```erb
<%= number_to_currency(@order.total_price, unit: '€', precision: 0) %>
<%= number_with_delimiter(1234567) %> <!--=> "1,234,567" -->
<%= number_to_percentage(0.256, precision: 1) %> <!--=> "25.6%" -->
```

These methods accept options for localization and precision to fit your needs.
