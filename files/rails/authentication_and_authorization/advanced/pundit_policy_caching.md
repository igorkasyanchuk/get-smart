## 🛡️ Cache Pundit Policy Results with Redis

In high‑traffic endpoints, repeatedly instantiating Pundit policies can degrade performance. By caching policy decisions in Redis for the duration of a request (or a defined TTL), you can skip re‑evaluation for identical objects and actions.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Pundit

  def policy_for(record)
    cache_key = "policy:#{current_user.id}:#{record.class.name}:#{record.id}:#{action_name}"
    Rails.cache.fetch(cache_key, expires_in: 5.minutes) do
      super
    end
  end
end
```

```ruby
# config/environments/production.rb
Rails.application.configure do
  config.cache_store = :redis_cache_store, { url: ENV['REDIS_URL'], namespace: 'cache' }
end
```

This memoizes `policy` objects and `authorize` checks, reducing DB calls and speeding up response times.