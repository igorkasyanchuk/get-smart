## 🔧 Using Splat and Double Splat for Variable Arguments

When you need to accept an arbitrary number of positional or keyword arguments, use the splat (`*args`) and double splat (`**kwargs`) operators. This keeps your methods flexible and forwards arguments easily to other calls.

```ruby
def log_event(event, *messages, **metadata)
  timestamp = Time.now
  puts "[#{timestamp}] " + messages.join(', ')
  metadata.each { |key, value| puts "#{key}: #{value}" }
end

log_event(
  'user_signup',
  'Started signup', 'Completed confirmation',
  user_id: 123, plan: 'pro'
)
```