## 🚫 Dynamic Throttles & Blacklists with Rack::Attack
For advanced DDOS and brute-force protection, use dynamic blocklists based on real-time metrics (e.g., burst spikes, malicious IP feeds). Combine throttles and blocklists for layered defense.

```ruby
# config/initializers/rack_attack.rb
class Rack::Attack
  # Block known bad IPs from external feed
  blocklist('block bad IPs') do |req|
    BadIpFeed.current.include?(req.ip)
  end

  # Throttle login attempts per IP
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    req.path == '/users/sign_in' && req.post? && req.ip
  end

  self.throttled_response = lambda do |env|
    [429, {'Content-Type' => 'text/plain'}, ["Throttled\n"]]
  end
end
```

Reload your blocklist periodically and tune `limit`/`period` to your traffic patterns.
