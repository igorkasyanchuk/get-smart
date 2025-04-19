## ⚡ Maximizing Throughput with Net::HTTP Persistent Pipelining

Use Net::HTTP’s pipelining support alongside persistent connections to send multiple GET/POST requests without waiting for each response, minimizing RTT overhead. Combine with thread pools for concurrent pipelines against the same server.

```ruby
require 'net/http'
require 'uri'
require 'concurrent'

uri = URI('http://api.highperf.com')
pool = Concurrent::FixedThreadPool.new(10)

# Open a persistent connection
http = Net::HTTP.new(uri.host, uri.port)
http.start do |conn|
  50.times do |i|
    pool.post do
      conn.pipeline do |p|
        p.get "/items/#{i}"
        p.post "/items", { name: "item#{i}" }.to_json, 'Content-Type' => 'application/json'
      end.each do |response|
        puts "Response #{response.code} for stream #{i}: #{response.body[0..30]}..."
      end
    end
  end
  pool.shutdown
  pool.wait_for_termination
end
```