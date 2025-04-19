## 🚀 Load Test Action Cable with Custom Client Simulation

To identify bottlenecks under heavy WebSocket load, build a custom Ruby client using `async-websocket` or any evented I/O library. You can spawn hundreds of virtual clients in threads/fibers to measure throughput, latency, and memory usage.

```ruby
# scripts/load_test_action_cable.rb
require 'async'
require 'async/http/WebSocket/client'

URL = 'wss://example.com/cable?token=TEST_JWT'
CLIENTS = 200

Async do |task|
  CLIENTS.times do
    task.async do
      Async::HTTP::WebSocket::Client.open(URL) do |ws|
        ws.write({command: 'subscribe', identifier: JSON.dump(channel: 'ChatChannel')}.to_json)
        ws.read do |message|
          # process or measure latency
        end
      end
    end
  end
end

puts "Finished #{CLIENTS} clients"
```

Run while profiling the server (e.g., with `rack-mini-profiler` or `derailed benchmarks`) to optimize thread pools, Redis connections, and GC tuning.