## 🚀 Stub GET Requests
WebMock allows you to stub external HTTP GET calls so your tests don't rely on real network connections. Simply disable real HTTP requests and define a stub with the expected URL and response. This makes your tests faster and more reliable.

```ruby
# spec_helper.rb or rails_helper.rb
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

# In your spec
stub_request(:get, 'https://api.example.com/users/1')
  .to_return(
    status: 200,
    body: '{"id":1,"name":"John"}',
    headers: { 'Content-Type' => 'application/json' }
  )

# Trigger the HTTP GET
response = Net::HTTP.get(URI('https://api.example.com/users/1'))

# Assert the stubbed response is used
expect(response).to include('John')
```