## 🎬 Dynamic Cassette Naming in RSpec

When you have many examples hitting external APIs, static cassette names can collide or become hard to track. Leveraging RSpec example metadata lets you generate unique, descriptive cassette names automatically. This approach keeps your recordings organized and simplifies debugging when a specific test fails.

```ruby
# spec/support/vcr.rb
RSpec.configure do |config|
  config.around(:each, :vcr) do |example|
    cassette_name = example.metadata[:full_description]
                       .underscore
                       .gsub(/[^a-z0-9_]+/, "_")
                       .gsub(/(^_|_$)/, "")

    VCR.use_cassette(cassette_name) do
      example.run
    end
  end
end

# spec/my_service_spec.rb
RSpec.describe MyService do
  it 'fetches data from API', :vcr do
    result = MyService.fetch_data
    expect(result).to include('status' => 'ok')
  end
end
```
