## 🌐 Integrate VCR and WebMock for Deterministic External Tests
Combine VCR cassettes with WebMock request expectations to assert HTTP interactions precisely. Use custom request matchers and cassette hooks for parameterized URIs and dynamic headers.

```ruby
# spec_helper.rb
VCR.configure do |c|
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { match_requests_on: [:method, :uri, lambda { |r1, r2| r1.headers['X-Auth-Token'] == r2.headers['X-Auth-Token'] }] }
end

RSpec.describe ExternalClient, :vcr do
  it 'fetches user data', :vcr do
    expect(WebMock).to have_requested(:get, /users\/\d+/).with(headers: { 'X-Auth-Token' => 'abc123' })
    ExternalClient.fetch_user(42)
  end
end
```