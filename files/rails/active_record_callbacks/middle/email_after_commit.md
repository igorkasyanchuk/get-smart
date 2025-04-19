## 📧 Send Emails After Commit with after_commit
Use `after_commit` to trigger external side-effects like sending emails only after the transaction successfully commits. This guards against sending notifications for rolled-back changes.

```ruby
class Purchase < ApplicationRecord
  after_commit :send_receipt_email, on: :create

  private

  def send_receipt_email
    ReceiptMailer.with(purchase: self).deliver_later
  end
end
```

`on: :create` ensures the callback runs only for new records, and `deliver_later` enqueues the mail job, keeping request times fast.