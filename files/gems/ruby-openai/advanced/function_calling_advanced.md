## 🛠 Advanced Function Calling and Dynamic Payloads

Leverage the OpenAI function calling API to execute domain‑specific operations. You can define functions at runtime, parse the model’s function calls, and dynamically dispatch to Ruby methods. This pattern secures side effects and ensures typed responses.

```ruby
require "ruby/openai"

FUNCTIONS = [
  {
    name: "get_weather",
    description: "Get current weather for a city",
    parameters: {
      type: "object",
      properties: { city: { type: "string" } },
      required: ["city"]
    }
  }
]

client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
response = client.chat.completions(parameters: {
  model: "gpt-4o",
  messages: [{ role: "user", content: "What's the weather in Paris?" }],
  functions: FUNCTIONS,
  function_call: "auto"
})

choice = response.dig("choices", 0)
if (func = choice.dig("message", "function_call"))
  payload = JSON.parse(func["arguments"])
  result  = WeatherService.call(payload["city"])  # Your domain logic
  # Send result back to the model for a natural‑language completion
  final = client.chat.completions(parameters: {
    model: "gpt-4o",
    messages: [
      choice["message"],
      { role: "function", name: func["name"], content: result.to_json }
    ]
  })
  puts final.dig("choices", 0, "message", "content")
end
```

This lets you enforce strong typing, secure function execution, and multi‑turn contexts by stitching model calls with your Ruby backend.