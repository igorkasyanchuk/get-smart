## 🚫 Limit Login Attempts to Prevent Brute Force Attacks

Use gems like `rack-attack` to throttle excessive requests to login endpoints.

```ruby
# config/initializers/rack_attack.rb
class Rack::Attack
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.ip
    end
  end
end
```