## ⏱️ Custom Retry DSL with Blocks

Create a retry mechanism with exponential backoff to wrap unstable operations. By passing a block, you can encapsulate any code and automatically retry on exceptions, improving resilience in external API calls or flaky services.

```ruby
def retry_on_error(times:, base_delay: 0.5)
  attempts = 0
  begin
    yield
  rescue StandardError => e
    attempts += 1
    raise if attempts > times
    sleep(base_delay * (2**(attempts - 1)))
    retry
  end
end

retry_on_error(times: 3, base_delay: 1) do
  # unstable operation
  fetch_remote_data
end
```