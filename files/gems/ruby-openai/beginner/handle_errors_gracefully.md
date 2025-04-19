## ⚠️ Handle Errors Gracefully

Wrap your API calls in `begin`/`rescue` to catch errors such as rate limits or invalid requests. This helps maintain a smooth user experience.

```ruby
begin
  response = client.chat.completions(
    parameters: { model: "gpt-3.5-turbo", messages: [...] }
  )
  puts response.dig("choices", 0, "message", "content")
rescue OpenAI::Error => e
  puts "OpenAI API error: #{e.message}"
end
```
