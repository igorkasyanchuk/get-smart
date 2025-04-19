## 📡 Making a Simple GET Request
HTTParty makes it easy to fetch data from an external API with a single line of code. You can send a GET request and immediately parse the response as JSON or plain text. This helps you integrate remote services quickly.

```ruby
require 'httparty'

response = HTTParty.get('https://api.example.com/users/1')
if response.code == 200
  user_data = response.parsed_response  # Parsed as a Ruby hash or array
  puts "User name: #{user_data['name']}"
else
  puts "Request failed with code #{response.code}"
end
```
