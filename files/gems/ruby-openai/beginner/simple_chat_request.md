## 🤖 Send Your First Chat Request

Use the `chat.completions` endpoint to send a conversation and receive a response. You define a system prompt and a user message to guide the assistant.

```ruby
response = client.chat.completions(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: [
      { role: "system", content: "You are a helpful assistant." },
      { role: "user", content: "Hello, who won the world series in 2020?" }
    ]
  }
)

puts response.dig("choices", 0, "message", "content")
```
