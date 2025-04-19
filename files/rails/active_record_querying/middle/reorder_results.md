## 🌐 Reordering Results with `reorder`

Use `reorder` to override any existing `order` clauses applied by default scopes or earlier in the chain. It generates a fresh `ORDER BY`, replacing previous orders.

```ruby
# Default order by name, then change to last sign-in
users = User.order(:name).reorder(last_sign_in_at: :desc)
```