## 🔍 Verify HTTP Requests
After stubbing requests, you might want to ensure your application is making the correct HTTP calls. WebMock provides matchers to verify that a request was issued with the expected method, URL, body, or headers. Use these assertions to guarantee your code interacts with external services as intended.

```ruby
# In your spec
# Trigger the actions that make HTTP calls
do_something_that_makes_http_call

# Verify the GET request was made once
expect(a_request(:get, 'https://api.example.com/users/1')).to have_been_made.once

# Verify a POST with specific JSON body
expect(a_request(:post, 'https://api.example.com/users')
  .with(
    headers: { 'Content-Type' => 'application/json' },
    body: { name: 'Alice' }.to_json
  )).to have_been_made
```