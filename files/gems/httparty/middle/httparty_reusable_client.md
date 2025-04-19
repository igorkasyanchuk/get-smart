## 🔧 Create a Reusable HTTParty Client

Encapsulate common settings like `base_uri`, headers, timeouts, and authentication in a dedicated class. This keeps your code DRY and makes it easy to swap endpoints or credentials in one place. You can then call instance methods to perform specific API actions.

```ruby
class MyApiClient
  include HTTParty
  base_uri 'https://api.example.com'
  default_timeout 5
  headers 'Accept' => 'application/json', 'User-Agent' => 'MyApp/1.0'
  basic_auth ENV['API_USER'], ENV['API_PASS']

  def fetch_user(id)
    self.class.get("/users/#{id}")
  end

  def create_post(attrs = {})
    self.class.post('/posts', body: attrs.to_json)
  end
end

# Usage:
client = MyApiClient.new
response = client.fetch_user(123)
p response.parsed_response
```