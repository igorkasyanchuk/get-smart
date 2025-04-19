## 🔌 Offloading Callbacks to Background Workers
Heavy callback logic can slow down web requests. Use ActiveJob to move expensive tasks into the background. This keeps your request cycle snappy and your callbacks robust.

```ruby
class User < ApplicationRecord
  after_create :schedule_welcome_email

  private

  def schedule_welcome_email
    WelcomeEmailJob.perform_later(id)
  end
end
```

With this pattern, the model remains unaware of the execution details, and the callback merely enqueues work. This decoupling improves performance and reliability under load.