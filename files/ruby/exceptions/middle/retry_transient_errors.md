## 🔄 Implementing Retry Logic with `retry`

For transient errors (network hiccups, database deadlocks), you can retry the operation a fixed number of times before giving up. Use a loop counter and `retry` inside `rescue`.

```ruby
attempts = 0
begin
  attempts += 1
  send_api_request
rescue Net::OpenTimeout, Net::ReadTimeout => e
  if attempts < 3
    sleep(0.5)  # backoff
    retry
  else
    raise e
  end
end
```

This code retries up to 3 times on timeouts, with a brief pause between each try.