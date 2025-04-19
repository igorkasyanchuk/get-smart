## 🔍 Performing a GET Request

Once your connection is configured, you can fetch data via GET requests, including query parameters and error handling. This tip shows how to request paginated data and handle different response statuses gracefully.

```ruby
# Use the existing `conn` from initializer
response = conn.get('/users') do |req|
  req.params['page']     = 1
  req.params['per_page'] = 20
end

if response.success?
  users = response.body       # parsed JSON (Array of user hashes)
  puts "Fetched #{users.size} users"
else
  puts "Error: #{response.status} - #{response.reason_phrase}"
end
```

This pattern makes it easy to pass dynamic parameters and handle both successful and error responses in a clean, predictable way. Use `response.headers` to inspect rate limits or pagination info if provided by the API.