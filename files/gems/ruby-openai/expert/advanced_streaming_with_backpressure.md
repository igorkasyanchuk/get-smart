## 🌀 Implement Advanced Streaming with Backpressure

When dealing with large streaming responses, controlling flow is critical to prevent memory bloat and ensure responsive processing. Use Ruby `Enumerator` combined with Fibers to pull tokens only when your application is ready, applying backpressure to the OpenAI stream. This pattern lets you integrate streaming into GUI callbacks or I/O-bound pipelines seamlessly.

```ruby
require 'openai'

client = OpenAI::Client.new

def stream_with_backpressure(client, params)
  Enumerator.new do |yielder|
    fiber = Fiber.current
    client.chat.completions(parameters: params, stream: proc { |chunk|
      Fiber.yield chunk.dig('choices', 0, 'delta', 'content')
    })
    yielder << nil
  end
end

stream = stream_with_backpressure(client, {
  model: "gpt-4o",
  messages: [{ role: "user", content: "Generate a poem." }]
})

stream.each do |token|
  break if token.nil?
  process_token(token)  # process or render per token
  sleep 0.05           # apply backpressure
end
```