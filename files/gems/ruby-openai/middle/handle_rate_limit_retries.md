## ⏱️ Implement Exponential Backoff for Rate Limits

API calls can exceed rate limits or fail transiently. Wrap your requests in retry logic with exponential backoff to handle 429 or 5xx errors gracefully. Use Ruby’s `retry` and `sleep` to pause before repeating.

```ruby
require "ruby/openai"

client = OpenAI::Client.new

def resilient_completion(client, params, max_retries: 5)
  attempts = 0
  begin
    client.chat.completions(parameters: params)
  rescue OpenAI::Error => e
    if [429, 500, 502, 503, 504].include?(e.http_status) && attempts < max_retries
      attempts += 1
      sleep(2**attempts) # exponential backoff
      retry
    else
      raise
    end
  end
end

response = resilient_completion(client, {
  model: "gpt-3.5-turbo",
  messages: [{ role: "user", content: "Help me with retries." }]
})
puts response.dig("choices", 0, "message", "content")
```

This pattern ensures robust handling of temporary errors and avoids overwhelming the API.