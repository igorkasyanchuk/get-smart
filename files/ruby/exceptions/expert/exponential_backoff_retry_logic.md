## ⏳ Implement Exponential Backoff with Retry Logic

For transient failures (e.g., network hiccups or rate limits), wrap operations in a retry loop with exponential backoff and jitter. This approach avoids thundering herd issues and respects external service limits.

```ruby
def with_exponential_backoff(max_retries: 5, base_delay: 0.5)
  retries = 0

  begin
    yield
  rescue TransientError => e
    raise if retries >= max_retries

    sleep_time = base_delay * (2**retries) * (0.5 + rand)
    logger.warn("Retry ##{retries + 1} in #{sleep_time.round(2)}s due to #{e.class}")
    sleep(sleep_time)

    retries += 1
    retry
  end
end

# Usage
token = with_exponential_backoff do
  ExternalService.fetch_token  # may raise TransientError
end
```

By including randomized jitter `(0.5 + rand)`, you spread out retries across clients to reduce collision.