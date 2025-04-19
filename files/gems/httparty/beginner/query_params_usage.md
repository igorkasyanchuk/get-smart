## 🔍 Adding Query Parameters to Requests
To filter or paginate results, include query parameters in your GET call using the `query` option. HTTParty automatically converts the hash into URL parameters, keeping your code clean and readable.

```ruby
require 'httparty'

options = {
  query: { page: 2, per_page: 10 },
  headers: { 'Accept' => 'application/json' }
}

response = HTTParty.get('https://api.example.com/posts', options)
posts = response.parsed_response
puts "Fetched #{posts.size} posts on page 2"
```
