## 🍎 Handle Pluralization Easily

Rails I18n automatically handles plural forms. Define `one:` and `other:` keys in your locale file, then pass the `count` option to `t`.

```yaml
# config/locales/en/cart.en.yml
en:
  cart:
    item_count:
      one: "You have 1 item in your cart."
      other: "You have %{count} items in your cart."
``` 
```erb
<!-- app/views/cart/show.html.erb -->
<p><%= t('cart.item_count', count: @cart.items.size) %></p>
```