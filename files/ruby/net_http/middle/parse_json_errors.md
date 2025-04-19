## 🔍 Parsing JSON Responses and Handling Errors

When consuming JSON APIs, always check response codes and rescue parse errors. Using `JSON.parse` inside a `begin/rescue` block ensures your app won’t blow up on invalid payloads.

```ruby
require 'net/http'
require 'uri'
require 'json'

uri = URI('https://api.example.com/items/1')
response = Net::HTTP.get_response(uri)

if response.is_a?(Net::HTTPSuccess)
  begin
    data = JSON.parse(response.body)
    puts "Item name: #{data['name']}"
  rescue JSON::ParserError => e
    warn "Failed to parse JSON: #{e.message}"
  end
else
  warn "Request failed (#{response.code}): #{response.message}"
end
```