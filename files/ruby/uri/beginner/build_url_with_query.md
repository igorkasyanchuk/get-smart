## 🏗️ Build a URL with Query Parameters

You can construct URLs programmatically by using `URI::HTTP.build` or `URI::HTTPS.build` and appending a query string handled by `URI.encode_www_form`. This ensures your parameters are properly escaped and avoids manual concatenation errors. For instance:

```ruby
require 'uri'

params = { search: 'ruby uri', page: 2 }
query_string = URI.encode_www_form(params)
uri = URI::HTTPS.build(host: 'www.example.com', path: '/search', query: query_string)

puts uri.to_s  #=> "https://www.example.com/search?search=ruby+uri&page=2"
```