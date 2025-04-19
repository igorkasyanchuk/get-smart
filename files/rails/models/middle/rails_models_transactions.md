## 🔐 Wrap Critical Changes in Transactions

Use database transactions to ensure data integrity when performing multiple related operations. If any step fails, the transaction rolls back everything to avoid partial updates. Wrap calls in `transaction` blocks and handle exceptions as needed.

```ruby
ApplicationRecord.transaction do
  order.update!(status: :paid)
  Payment.create!(order: order, amount: order.total_price)
  Inventory.decrement_stock!(order.items)
end
```