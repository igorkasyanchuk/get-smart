## 🔍 Monitor Jobs with Sidekiq Web

Sidekiq provides a web UI to view queues, retries, and job stats. Mount it in your routes and secure access.

```ruby
# config/routes.rb
require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # ... your other routes
end
```

Visit `http://localhost:3000/sidekiq` to see real-time job dashboards and retry failed jobs.