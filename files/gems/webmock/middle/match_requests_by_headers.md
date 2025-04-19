## 🛡 Match Requests by Headers
To ensure your HTTP calls include required headers (such as API keys or custom tokens), you can stub and verify requests based on header values. WebMock’s `with` option allows you to specify expected headers and body patterns, so only requests matching those criteria are stubbed or asserted.

```ruby
require 'webmock/rspec'

# Stub a POST request only if it includes the Authorization header and JSON body
stub_request(:post, 'https://api.example.com/create')
  .with(
    headers: { 'Authorization' => 'Bearer token123', 'Content-Type' => 'application/json' },
    body: /"name":"Test User"/
  )
  .to_return(status: 201, body: '{"success":true}', headers: {})

# Make the request in your code
response = Net::HTTP.start('api.example.com', 443, use_ssl: true) do |http|
  req = Net::HTTP::Post.new('/create', 'Content-Type' => 'application/json', 'Authorization' => 'Bearer token123')
  req.body = { name: 'Test User' }.to_json
  http.request(req)
end

# Verify that the stubbed request was made
expect(WebMock).to have_requested(:post, 'https://api.example.com/create')
  .with(headers: { 'Authorization' => 'Bearer token123' })
```