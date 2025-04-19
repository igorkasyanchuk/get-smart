## 🏗️ Avoid N+1 in Callbacks by Preloading Dependencies

Callbacks that touch associations can trigger N+1 queries when run per record. Preload dependencies in bulk before invoking callbacks or use `after_commit` batching to minimize database hits.

```ruby
# In a service object
records = Order.includes(:line_items, :customer).where(status: 'pending')
records.find_each(batch_size: 500) do |order|
  order.process!   # callbacks will reuse preloaded associations
end
```