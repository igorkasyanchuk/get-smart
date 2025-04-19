## 🔒 Handling HTTPS Requests

When accessing secure endpoints, enable SSL on the `Net::HTTP` object. Set `use_ssl = true` and configure `verify_mode` to validate SSL certificates. This ensures your data stays encrypted in transit.

```ruby
require 'net/http'
require 'uri'

uri = URI('https://secure.example.com/data')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER  # Verify server certificate

request = Net::HTTP::Get.new(uri)
response = http.request(request)
puts response.body
```