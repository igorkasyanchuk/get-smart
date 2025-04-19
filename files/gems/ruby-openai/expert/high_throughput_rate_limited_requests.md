## 🚀 Orchestrate High‑Throughput, Rate‑Limited Requests with Retries

In large-scale systems, you’ll need to batch and throttle your requests to avoid 429 errors. Combine `concurrent-ruby` with a leaky‑bucket rate limiter and exponential backoff on retries. This pattern ensures your service remains performant under heavy load while gracefully handling OpenAI rate limits.

```ruby
require 'openai'
require 'concurrent'

class RateLimiter
  def initialize(rate_per_sec)
    @interval = 1.0 / rate_per_sec
    @last = Time.now - @interval
    @mutex = Mutex.new
  end

  def acquire
    @mutex.synchronize do
      wait = @interval - (Time.now - @last)
      sleep(wait) if wait.positive?
      @last = Time.now
    end
  end
end

client = OpenAI::Client.new
limiter = RateLimiter.new(5)

tasks = (1..100).map do |i|
  Concurrent::Promise.execute do
    limiter.acquire
    begin
      client.chat.completions(model: 'gpt-4o', messages: [{ role: 'user', content: "Q#{i}" }])
    rescue OpenAI::Error => e
      sleep(2 ** retry_count)
      retry if (retry_count += 1) < 5
      raise
    end
  end
end

results = tasks.map(&:value)
```