## 🌐 HTTP GET with Net::HTTP

Ruby's `Net::HTTP` library provides a simple way to perform HTTP requests without external gems. You can make GET requests to retrieve web pages or API data. Here's how to fetch JSON from a public API and parse it.

```ruby
require 'net/http'
require 'json'

uri = URI('https://api.github.com/repos/ruby/ruby')
response = Net::HTTP.get(uri)
data = JSON.parse(response)
puts "Ruby Repo Stars: #{data['stargazers_count']}"
```