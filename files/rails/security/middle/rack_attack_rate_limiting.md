## ⚡ Throttle Requests with Rack::Attack

Use Rack::Attack middleware to limit repeated requests and prevent brute-force or DDoS attacks. Define throttles based on IP or endpoint.

```ruby
# Gemfile
gem 'rack-attack'

# config/initializers/rack_attack.rb
class Rack::Attack
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    req.ip if req.path == '/login' && req.post?
  end
end

# config/application.rb
config.middleware.use Rack::Attack
```
