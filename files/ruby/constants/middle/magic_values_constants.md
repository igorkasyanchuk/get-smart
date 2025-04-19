## 🎯 Replace Magic Values with Descriptive Constants

Using constants for magic numbers or strings makes your code self-documenting and reduces the risk of typos. When you see `MAX_RETRIES` instead of `3`, the intent is immediately clear and it's easier to adjust the value in one place.

```ruby
# lib/retry_logic.rb
module RetryLogic
  MAX_RETRIES = 5
  RETRY_DELAY = 0.2 # seconds

  def with_retries
    attempts = 0
    begin
      yield
    rescue StandardError => e
      attempts += 1
      retry if attempts <= MAX_RETRIES
      raise e
    end
  end
end
```

```ruby
class Worker
  include RetryLogic

  def perform
    with_retries do
      # your job logic here
    end
  end
end
```
