## 🍀 Use Net::HTTP::Persistent for Connection Reuse

Net::HTTP::Persistent maintains a pool of reusable TCP connections, reducing latency for multiple requests to the same host. This is especially useful when calling the same API endpoints repeatedly in a loop or background job. You can set timeouts and custom headers once and then perform GET/POST calls without reopening sockets each time.

```ruby
require 'net/http/persistent'

http = Net::HTTP::Persistent.new(name: 'my-client')
http.read_timeout = 5
http.idle_timeout = 10

uri = URI('https://api.example.com/data')
response = http.request(uri)
puts response.body if response.is_a?(Net::HTTPSuccess)
```