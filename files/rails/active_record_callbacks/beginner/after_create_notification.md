## 📬 Sending Notifications with `after_create`
Use `after_create` to trigger side effects such as sending emails or notifications once a record is successfully created. This keeps controllers thin and focuses logic in the model.

```ruby
class Order < ApplicationRecord
  after_create :send_confirmation_email

  private

  def send_confirmation_email
    OrderMailer.confirmation(self).deliver_later
  end
end
```

This callback enqueues an email job after the order record commits to the database.