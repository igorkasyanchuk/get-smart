## 🔍 Monitor Sidekiq with the Web UI

Sidekiq ships a web interface to inspect queues, retries, and job history. Mount it in your Rails routes and secure it (e.g., with basic auth) before using in production.

```ruby
# config/routes.rb
require 'sidekiq/web'
Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  ActiveSupport::SecurityUtils.secure_compare(username, ENV['SIDEKIQ_USER']) &
    ActiveSupport::SecurityUtils.secure_compare(password, ENV['SIDEKIQ_PASSWORD'])
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
end
```