## 🕸 Stub Dynamic URLs with Regex Patterns
When your application makes HTTP calls to URLs that include dynamic segments—like user IDs or timestamps—you can use regular expressions in WebMock to stub them without enumerating every possible URL. This approach keeps your stubs concise and maintainable. Simply pass a Ruby `Regexp` to `stub_request` to match any URL fitting the pattern.

```ruby
require 'webmock/rspec'

# Stub any GET request to /users/<number>/details
stub_request(:get, %r{https://api\.example\.com/users/\d+/details})
  .to_return(
    status: 200,
    body: '{"id":123,"name":"John Doe"}',
    headers: { 'Content-Type' => 'application/json' }
  )

# Example call
response = Net::HTTP.get(URI('https://api.example.com/users/456/details'))
puts response #=> {"id":123,"name":"John Doe"}
```