## 🏎️ Leverage Net::HTTP::Persistent for Connection Pooling

By default, Net::HTTP opens and closes a TCP connection per request, which incurs high latency under load. Use the `net-http-persistent` gem to maintain keep‑alive connections across threads or forks, dramatically reducing handshake overhead. You can configure idle timeouts, custom DNS resolvers, and per‑host connection pools.

```ruby
require 'net/http/persistent'

http = Net::HTTP::Persistent.new(name: 'my_app')
http.idle_timeout = 30   # seconds to keep sockets alive
http.pool_size    = 5    # max simultaneous connections

uri = URI('https://api.example.com/data')
response = http.request(uri) # reuses a live socket if available
puts response.body
```

You can also set custom `open_timeout`, `read_timeout`, and override `proxy_from_env` to automatically pick up system proxy settings.