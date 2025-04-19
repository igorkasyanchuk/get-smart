## 📝 POSTing Form Data Easily

To send `application/x-www-form-urlencoded` data, use `Net::HTTP.post_form` for quick requests or build your own `Net::HTTP::Post` to customize headers. This is handy for simple form submissions.

```ruby
require 'net/http'
require 'uri'

uri = URI('https://api.example.com/users')
# Quick helper:
response = Net::HTTP.post_form(uri, { name: 'John', email: 'john@example.com' })
puts response.code, response.body

# Manual approach for more control:
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri)
request['Content-Type'] = 'application/x-www-form-urlencoded'
request.set_form_data(name: 'John', email: 'john@example.com')
response = http.request(request)
puts response.code, response.body
```