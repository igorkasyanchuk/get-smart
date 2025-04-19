## 🔍 Use `block_given?` to Guard Behavior

`block_given?` checks if a block was passed without converting it to a `Proc`. This lightweight check avoids errors when calling `yield` and lets you choose between different execution paths. It’s ideal for methods that optionally accept blocks.

```ruby
def maybe_log(msg)
  if block_given?
    puts "Before: #{msg}"
    yield
    puts "After: #{msg}"
  else
    puts msg
  end
end

maybe_log("Process") do
  puts "Running..."
end
# Before: Process
# Running...
# After: Process

maybe_log("Simple")
# Simple
```