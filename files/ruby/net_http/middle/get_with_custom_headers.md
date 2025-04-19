## 📬 Custom GET Requests with Headers

When interacting with APIs, you often need to add custom headers (e.g., Authorization, Accept) and query parameters. Build a `Net::HTTP::Get` request, set your headers, and pass the URI with encoded params.

```ruby
require 'net/http'
require 'uri'

uri = URI('https://api.example.com/data')
uri.query = URI.encode_www_form({ page: 1, per_page: 20 })

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = (uri.scheme == 'https')

request = Net::HTTP::Get.new(uri)
request['Authorization'] = "Bearer #{ENV['API_TOKEN']}"
request['Accept'] = 'application/json'

response = http.request(request)
puts response.body
```
