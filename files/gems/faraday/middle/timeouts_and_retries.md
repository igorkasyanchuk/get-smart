## ⏱️ Setting Timeouts and Retries
Handling intermittent network failures and slow endpoints is crucial for resilient applications. Faraday’s built‑in retry middleware and timeout options let you fine‑tune how many times to retry failed requests and how long to wait before timing out.

Configure timeouts and retry behavior in the connection block:

```ruby
require 'faraday'
require 'faraday/retry'

conn = Faraday.new(url: 'https://api.example.com') do |f|
  # Timeout settings (in seconds)
  f.options.open_timeout = 2   # connection open timeout
  f.options.timeout      = 5   # response read timeout

  # Retry middleware configuration
  f.request :retry, max: 3,                # retry up to 3 times
                    interval: 0.5,         # initial wait time
                    interval_randomness: 0.5, # jitter
                    backoff_factor: 2,     # exponential backoff
                    retry_statuses: [429, 500, 502, 503, 504]

  f.adapter Faraday.default_adapter
end

response = conn.get('/unstable_endpoint')
puts "Status: #{response.status}", response.body