## 💥 Preserve Exception Cause when Wrapping

When you need to wrap lower-level exceptions while maintaining their backtrace and causal chain, use the built-in `cause` keyword (Ruby 2.1+). This lets you re-raise domain-specific errors without losing the original context, which is essential for debugging complex flows.

```ruby
class MyDomainError < StandardError; end

begin
  perform_low_level_operation
rescue StandardError => e
  # Wrap the original exception and preserve its backtrace
  raise MyDomainError.new("High-level operation failed"), cause: e
end
```

You can later inspect the chain:

```ruby
rescue MyDomainError => err
  puts err.message              # => "High-level operation failed"
  puts err.cause.class         # => original exception class
  puts err.cause.backtrace     # => preserved backtrace array
end
```