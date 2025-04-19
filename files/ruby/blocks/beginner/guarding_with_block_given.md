## 🎯 Checking for a Block with block_given?
Using `block_given?` inside a method prevents errors when no block is passed. It's a safety net to decide whether to call `yield`.

```ruby
def log(message)
  if block_given?
    yield(message)
  else
    puts "Log: #{message}"
  end
end

log("Starting...")
# => "Log: Starting..."

log("Custom...") do |msg|
  puts "*** #{msg} ***"
end
# => "*** Custom... ***"
```