## ⚡️ Dispatch Parallel Requests with Threads

To speed up batch operations (e.g., summarizing multiple documents), you can fire concurrent requests using Ruby threads. This approach helps you utilize I/O waits efficiently while staying within your API rate limits.

```ruby
require "ruby/openai"

client = OpenAI::Client.new

documents = ["Doc 1 text...", "Doc 2 text...", "Doc 3 text..."]

threads = documents.map.with_index do |doc, i|
  Thread.new do
    response = client.chat.completions(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: "Summarize: #{doc}" }]
      }
    )
    puts "Summary #{i+1}: " + response.dig("choices", 0, "message", "content")
  end
end

threads.each(&:join)
```

Each thread issues an API call concurrently, reducing total elapsed time. Ensure you monitor rate usage to avoid hitting caps.