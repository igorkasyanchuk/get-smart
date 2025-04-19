## 🚀 Streaming Chat Responses with Enumerator

Streaming responses allow you to process tokens as they arrive, reducing latency and providing real‑time interactivity. The `ruby-openai` client exposes an `stream` method that returns an Enumerator of chunks. You can `each` over it to handle partial content, implement custom timeouts, and gracefully handle errors or cancellations.

```ruby
require "ruby/openai"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

stream = client.chat.completions(stream: true, parameters: {
  model: "gpt-4o",
  messages: [{ role: "user", content: "Generate a haiku about autumn." }]
})

stream.each do |chunk|
  # Each chunk is a hash: { "choices" => [{ "delta" => { "content"=>"..." } }] }
  text = chunk.dig("choices", 0, "delta", "content")
  print text if text
end
```

By reading partial chunks, you can update UI elements in real time, abort streaming early when thresholds are met, or handle rate‑limit retries transparently.