## 🛡️ Implement Rate Limiting in Controllers
Protect endpoints from abuse by throttling requests. Integrate Rack Attack or custom middleware and check rate limits in controllers for specific actions.

```ruby
# config/initializers/rack_attack.rb
class Rack::Attack
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    req.ip if req.path == '/login' && req.post?
  end
end
```

In your controller, handle rejections gracefully:
```ruby
class SessionsController < ApplicationController
  rescue_from Rack::Attack::LimitReached, with: :rate_limit_exceeded

  def create
    # login logic
  end

  private

  def rate_limit_exceeded
    render json: { error: 'Too many login attempts' }, status: :too_many_requests
  end
end
```