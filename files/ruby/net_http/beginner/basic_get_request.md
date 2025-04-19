## 🚀 Basic GET Request

Using `Net::HTTP.get` for quick HTTP GET calls. Parse the URL with `URI` and fetch the response body in one line. Great for simple API calls or fetching HTML pages.

```ruby
require 'net/http'
require 'uri'

uri = URI('http://example.com/')
response = Net::HTTP.get(uri)
puts response
```