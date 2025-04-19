## 🔄 Retry with Exponential Backoff

Implement resilient retry logic for transient failures (e.g., network calls) by combining rescue, dynamic sleep intervals, and retry. Exponential backoff reduces load on upstream services and increases success probability. Cap the backoff and number of attempts to avoid infinite loops.

```ruby
MAX_RETRIES = 5
BASE_DELAY = 0.5

def fetch_remote_data(attempts = 0)
  external_service.call
rescue Net::OpenTimeout, Net::ReadTimeout => e
  raise if attempts >= MAX_RETRIES
  sleep(BASE_DELAY * (2 ** attempts))
  fetch_remote_data(attempts + 1)
end
```

This pattern yields delays: 0.5s, 1s, 2s…, up to your max attempts.