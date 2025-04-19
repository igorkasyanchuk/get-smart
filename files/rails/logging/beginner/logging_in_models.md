## 🗄️ Logging in Models and Jobs
You can also log from models or background jobs to capture domain-specific events. This helps you trace business logic independently of controller actions.

```ruby
class Order < ApplicationRecord
  def place
    Rails.logger.info "Placing order ID=#{id} for user #{user_id}"
    # ... order logic ...
  rescue => e
    Rails.logger.error "Failed to place order ID=#{id}: #{e.message}"
    raise
  end
end

class SendEmailJob < ApplicationJob
  def perform(user_id)
    Rails.logger.info "Sending welcome email to User##{user_id}"
    # ... email logic ...
  end
end
```
