## 🔍 Parse a URL

Use `URI.parse` to break down a URL string into its components such as scheme, host, path, and query. This helps you validate and manipulate parts of a URL without manual string operations. Here's how you parse and access each part.

```ruby
require 'uri'

url = 'https://www.example.com:8080/path/page?name=John&Doe'
uri = URI.parse(url)

puts uri.scheme   #=> "https"
puts uri.host     #=> "www.example.com"
puts uri.port     #=> 8080
puts uri.path     #=> "/path/page"
puts uri.query    #=> "name=John&Doe"
```