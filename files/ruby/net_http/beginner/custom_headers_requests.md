## 🛠️ Adding Custom Headers to Requests

Customize your HTTP requests by adding headers such as `User-Agent`, `Authorization`, or API keys. Create a `Net::HTTP::Get` (or other) request object and assign headers before sending.

```ruby
require 'net/http'
require 'uri'

uri = URI('http://api.example.com/secure-data')
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.path)
# Set custom headers
request['User-Agent'] = 'MyRubyClient/1.0'
request['Authorization'] = 'Bearer your_token_here'

response = http.request(request)
puts "Status: #{response.code}"
puts response.body
```