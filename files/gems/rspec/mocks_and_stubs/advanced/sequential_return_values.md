## 🔄 Stub Sequential Return Values for State-dependent Logic

When testing workflows that change return values over multiple calls, stub methods with ordered responses. This simulates state transitions or external service retries.

```ruby
retry_service = double("RetryService")
allow(retry_service).to receive(:attempt).and_return(false, false, true)

results = 3.times.map { retry_service.attempt }
expect(results).to eq([false, false, true])
```

Use this pattern for paginated APIs, exponential backoff tests, or multi-step processes.