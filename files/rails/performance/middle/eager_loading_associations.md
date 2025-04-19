## 🚀 Eager Load Associations

Avoid N+1 queries by preloading associations with `includes`. This fetches associated records in a single query instead of one per record, improving response times when rendering lists.

```ruby
# app/controllers/orders_controller.rb
def index
  @orders = Order.includes(:customer, :items)
end
```
