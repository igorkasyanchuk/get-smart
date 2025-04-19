## 🔁 Implement Custom Retry with Exponential Backoff

Network hiccups and transient 5xx errors are inevitable. Build a robust wrapper that retries **idempotent** requests (GET, HEAD) with exponential backoff, jitter, and max‑attempt caps to avoid hammering the server.

```ruby
require 'net/http'

def fetch_with_retry(uri_str, max_attempts: 5)
  uri = URI(uri_str)
  attempts = 0

  begin
    attempts += 1
    response = Net::HTTP.get_response(uri)
    raise 'Server error' if response.code.to_i >= 500
    return response
  rescue => e
    raise if attempts >= max_attempts
    sleep_time = (2**attempts) * 0.5 + rand(0.1..0.5)
    sleep(sleep_time)
    retry
  end
end

resp = fetch_with_retry('https://api.example.com/resource')
puts resp.body
```

This strategy spreads out retries, reduces thundering‑herd effects, and keeps your clients polite under load.