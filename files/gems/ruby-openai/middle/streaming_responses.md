## 🎥 Use Streaming for Real‑Time Responses

When interacting with large language models, you can process partial outputs as they arrive by enabling streaming. This reduces latency and lets you display or process tokens in real time. Simply set `stream: proc` and handle each chunk in the callback.

```ruby
require "ruby/openai"

client = OpenAI::Client.new

client.chat.completions(
  parameters: {
    model: "gpt-4o-mini",
    messages: [{ role: "user", content: "Explain streaming in Ruby." }],
    stream: proc { |chunk| print chunk.dig("choices", 0, "delta", "content") }
  }
)
```

This will print tokens as they arrive, allowing you to build a live UI or log partial data without waiting for the full response.