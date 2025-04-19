## 🔄 Exponential Backoff with Retry Middleware

Faraday's built-in retry middleware can be configured with exponential backoff and jitter to gracefully handle transient failures. This advanced setup reduces thundering‐herd issues by randomizing delays and capping the maximum interval.

```ruby
connection = Faraday.new('https://api.example.com') do |f|
  f.request :retry, max: 5,
                    interval: 0.5,
                    interval_randomness: 0.5,
                    backoff_factor: 2,
                    retry_statuses: [429, 500, 502, 503, 504],
                    methods: %i[get post]
  f.response :raise_error
  f.adapter :net_http
end

# Example request
response = connection.get('/resources')
puts response.body
```