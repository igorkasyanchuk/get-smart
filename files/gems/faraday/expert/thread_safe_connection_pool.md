## 🔧 Thread‑Safe Connection Pooling with Faraday

For high‑throughput or multi‑threaded environments, wrap your Faraday client in a connection pool to reuse persistent connections safely. Combining the `connection_pool` gem with a persistent adapter prevents socket churn and ensures thread safety under load.

```ruby
# Gemfile
# gem 'faraday'
# gem 'connection_pool'
# gem 'faraday-net_http_persistent'

require 'faraday'
require 'connection_pool'
require 'faraday/net_http_persistent'

# Define a global thread‑safe pool
HTTP_POOL = ConnectionPool.new(size: 10, timeout: 5) do
  Faraday.new(url: 'https://api.service.com') do |builder|
    builder.request :retry, max: 3, interval: 0.1, max_interval: 1, backoff_factor: 2
    builder.adapter :net_http_persistent       # Maintains keep‑alive connections
  end
end

# Use inside threads or concurrent jobs
threads = 10.times.map do
  Thread.new do
    HTTP_POOL.with do |conn|
      response = conn.get('/v1/data')
      process(response.status, response.body)
    end
  end
end
threads.each(&:join)
```