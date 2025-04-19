## #️⃣ Advanced Pluralization with Multiple Counts
Rails I18n supports single-variable pluralization out of the box. To handle multiple counts (e.g., items and sellers), define composite keys and pass both counts to `I18n.t`, allowing context-aware messages.

```yaml
# config/locales/en.yml
en:
  cart:
    items:
      zero: "Your cart is empty."
      one: "You have %{count_items} item from %{count_sellers} seller."
      other: "You have %{count_items} items from %{count_sellers} sellers."
```

```ruby
# Usage in helper or model
def cart_status(cart)
  I18n.t(
    'cart.items', 
    count: cart.items.size,      # triggers pluralization
    count_items: cart.items.size,
    count_sellers: cart.sellers.size
  )
end
```
