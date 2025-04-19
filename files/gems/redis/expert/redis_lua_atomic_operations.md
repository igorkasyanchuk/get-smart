## 🧵 Atomic Operations with Redis Lua Scripts

Leverage Redis Lua scripting to bundle multiple operations into a single atomic round-trip, eliminating race conditions and reducing network latency. By writing your logic in Lua, you ensure the entire script executes as one transaction.

```lua
-- rate_limit.lua
local key = KEYS[1]
local limit = tonumber(ARGV[1])
local now = tonumber(ARGV[2])

-- Remove outdated entries
redis.call('ZREMRANGEBYSCORE', key, 0, now - 60)

-- Count current entries
local count = redis.call('ZCARD', key)
if count >= limit then
  return 0
end

-- Add current timestamp
redis.call('ZADD', key, now, now)
redis.call('EXPIRE', key, 61)
return 1
```

```ruby
# config/initializers/redis.rb
REDIS = Redis.new(url: ENV.fetch('REDIS_URL'))

# app/services/rate_limiter.rb
class RateLimiter
  LUA = File.read(Rails.root.join('rate_limit.lua'))

  def initialize(key, limit)
    @key = key
    @limit = limit
  end

  def allowed?
    now = (Time.now.to_f * 1000).to_i
    result = REDIS.eval(LUA, keys: [@key], argv: [@limit, now])
    result == 1
  end
end
```
