## 🎯 Use Lua Scripting for Atomic Operations
Lua scripts in Redis ensure that a sequence of operations is executed atomically, avoiding race conditions without external locks. You can bundle complex logic (e.g., conditional updates, increments, and expirations) into one script and call it via `EVAL`, reducing latency and improving consistency. Always load scripts with `SCRIPT LOAD` to get a SHA for faster execution with `EVALSHA`.

```ruby
require 'redis'
redis = Redis.new

# Define a Lua script that increments a counter and sets an expiry only on first use
lua = <<~LUA
  local current = redis.call('INCR', KEYS[1])
  if current == 1 then
    redis.call('EXPIRE', KEYS[1], ARGV[1])
  end
  return current
LUA

# Load script and store its SHA1 hash
sha = redis.script(:load, lua)

# Execute the script atomically using EVALSHA
count = redis.evalsha(sha, keys: ['page:42:views'], argv: ['3600'])
puts "Page 42 view count: #{count}"