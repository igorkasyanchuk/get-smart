## 🔗 Exception Cause Chaining

Preserve original error context when wrapping low‑level exceptions in higher‑level ones using the `cause:` keyword. This makes debugging easier by retaining the backtrace of the root failure. Later you can inspect `e.cause` to drill down into the source.

```ruby
begin
  JSON.parse(payload)
rescue JSON::ParserError => json_err
  raise DataProcessingError.new("Payload parsing failed"), cause: json_err
end

begin
  process_data(payload)
rescue DataProcessingError => e
  logger.error "Error: #{e.message}"
  logger.error "Cause: #{e.cause.class} - #{e.cause.message}\n#{e.cause.backtrace.join("\n")}"
end
```