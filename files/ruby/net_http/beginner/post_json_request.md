## 📤 Sending a POST Request with JSON

Use `Net::HTTP` to send a POST request with a JSON payload. Set the `Content-Type` header and convert a Ruby hash to JSON using `to_json`. You can then check the response code and parse the response body.

```ruby
require 'net/http'
require 'uri'
require 'json'

uri = URI('http://api.example.com/items')
headers = { 'Content-Type' => 'application/json' }
body = { name: 'Sample', quantity: 10 }

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.path, headers)
request.body = body.to_json
response = http.request(request)
puts response.code
puts response.body
```