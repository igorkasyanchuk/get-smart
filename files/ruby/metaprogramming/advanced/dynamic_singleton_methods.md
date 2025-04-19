## 🔒 Securing dynamic singletons with `define_singleton_method`
Use `define_singleton_method` to add methods to individual objects safely, encapsulating behavior without modifying classes or using `eval`.

```ruby
api_client = Object.new
api_client.define_singleton_method(:fetch_data) do |endpoint|
  HTTP.get("https://api.example.com/#{endpoint}")
end

api_client.fetch_data('users')
```