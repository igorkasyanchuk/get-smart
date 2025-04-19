## 🤖 Dynamic Stub Responses with Request-Based Logic
Use block-based stubs to inspect incoming requests and craft conditional responses. This approach is ideal for testing APIs with role-based access, feature flags, or custom headers without creating multiple static stubs.

```ruby
require 'webmock'
include WebMock::API

WebMock.disable_net_connect!(allow_localhost: false)

# Dynamic stub based on request payload
stub_request(:post, %r{https://api\.example\.com/resources})
  .to_return do |request|
    data = JSON.parse(request.body)
    if data["id"] == "admin"
      {
        status: 200,
        body: { message: "Welcome, admin!" }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      }
    else
      {
        status: 403,
        body: { error: "Forbidden" }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      }
    end
  end

# Example requests
response_admin = Net::HTTP.post(
  URI("https://api.example.com/resources"),
  { id: 'admin' }.to_json,
  "Content-Type" => "application/json"
)
puts response_admin.body
# => {"message":"Welcome, admin!"}

response_guest = Net::HTTP.post(
  URI("https://api.example.com/resources"),
  { id: 'guest' }.to_json,
  "Content-Type" => "application/json"
)
puts response_guest.body
# => {"error":"Forbidden"}
```