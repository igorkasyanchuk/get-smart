## 🛑 Rate Limiting with Rack::Attack

Protect endpoints by throttling abusive clients. Use custom lambda conditions and dynamic block lists.

```ruby
# config/initializers/rack_attack.rb
class Rack::Attack
  throttle('req/ip', limit: 100, period: 1.minute) do |req|
    req.ip
  end

  blocklist('block bad user agents') do |req|
    req.user_agent =~ /BadBot/i
  end
end

Rails.application.config.middleware.use Rack::Attack
```