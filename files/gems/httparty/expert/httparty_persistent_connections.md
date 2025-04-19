## 🔥 Leveraging Persistent HTTP Connections
By default, HTTParty opens a new TCP connection for each request. For high‑throughput services, you can enable TCP keep‑alive and connection pooling to reduce latency and resource usage. Here’s how to configure a persistent connection pool using the `persistent` option:

```ruby
require 'httparty'

class ApiClient
  include HTTParty
  base_uri 'https://api.example.com'

  # Enable keep‑alive with a pool of 5 connections and 30s idle timeout
  default_options.merge!(persistent: { pool_size: 5, idle_timeout: 30 })

  def fetch_user(id)
    self.class.get("/users/#{id}")
  end
end

client = ApiClient.new
100.times do |i|
  Thread.new { puts client.fetch_user(i).code }
end.join
```

This setup reuses up to 5 live connections. You’ll see dramatic improvements in throughput, especially under concurrent load.