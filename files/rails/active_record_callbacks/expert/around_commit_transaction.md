## 🚀 Leveraging `around_commit` for Transaction-Dependent Logic
Use `around_commit` to wrap logic that must run only after a successful DB transaction. This ensures that side effects (e.g., external API calls) occur only when the transaction actually commits. You can yield to the block to execute the transaction and then perform post-commit work.

```ruby
class Order < ApplicationRecord
  around_commit :notify_shipping_service, on: :create

  private

  def notify_shipping_service
    yield  # runs the DB transaction
    ShippingService.enqueue(self.id)
  end
end
```

This pattern avoids race conditions by deferring external calls until after commit. You can also use `on: :update` or `:destroy` to scope it further.
