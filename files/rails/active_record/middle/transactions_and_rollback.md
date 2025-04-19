## 💾 Wrap Operations in Transactions

Group multiple database changes in a transaction to ensure atomicity. If an exception occurs, all changes roll back automatically.

```ruby
ApplicationRecord.transaction do
  order.update!(status: 'processing')
  payment.charge!(amount)
  shipment.create!(order: order)
end
```