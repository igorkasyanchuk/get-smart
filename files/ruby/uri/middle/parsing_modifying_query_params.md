## 🔗 Parsing and Modifying Query Parameters

When working with URLs in Ruby, you can parse and manipulate the query string easily by combining `URI` and `CGI`. First, parse the URL, then convert the query into a hash, modify it as needed, and reassign the encoded query back to the URI object.

```ruby
require 'uri'
require 'cgi'

url = 'https://api.example.com/search?q=ruby&lang=en'
uri = URI.parse(url)
params = CGI.parse(uri.query)
# Add or modify parameters
params['page'] = ['2']
params['lang'] = ['ja']

# Rebuild the query string
uri.query = URI.encode_www_form(params)
puts uri.to_s
# => "https://api.example.com/search?q=ruby&lang=ja&page=2"
```