## 🔍 Custom Request Matching

By default VCR matches on method and URI, but sometimes you need to ignore dynamic query params or headers. Registering a custom matcher lets you focus on the parts that matter and avoid unnecessary cassette rewrites when non‑essential details change.

```ruby
# spec/support/vcr.rb
VCR.configure do |c|
  # Register a matcher that strips timestamps from URIs
  c.register_request_matcher :uri_without_timestamp do |r1, r2|
    uri1 = URI(r1.uri); uri1.query = nil
    uri2 = URI(r2.uri); uri2.query = nil
    uri1 == uri2
  end
end

# In your test
VCR.use_cassette('weather_api', match_requests_on: [:method, :uri_without_timestamp]) do
  response = WeatherClient.get_forecast(city: 'London', timestamp: Time.now.to_i)
  expect(response.code).to eq(200)
end
```
