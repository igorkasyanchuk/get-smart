## 🎞️ Record and Replay HTTP Interactions

Use VCR cassettes to wrap code that makes HTTP requests so responses are recorded on first run and replayed thereafter. You can use RSpec metadata or explicitly call `VCR.use_cassette`. This ensures your tests stay fast and deterministic.

```ruby
# Using RSpec metadata (requires config.configure_rspec_metadata!)
describe 'External API fetch', :vcr do
  it 'retrieves user info' do
    response = Net::HTTP.get(URI('https://api.example.com/user/1'))
    expect(response).to include('username')
  end
end

# Or explicitly:
VCR.use_cassette('user_fetch') do
  response = HTTP.get('https://api.example.com/user/1')
  puts response.to_s
end
```