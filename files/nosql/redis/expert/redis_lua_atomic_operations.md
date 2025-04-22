## 🛡️ Atomic Multi-key Operations with Lua Scripts
Leverage Redis' built‑in Lua engine to execute complex, multi‑key operations atomically, avoiding race conditions in high‑concurrency environments. By preloading scripts with `SCRIPT LOAD` and invoking them via `EVALSHA`, you minimize network overhead and ensure deterministic execution. This approach is invaluable for token buckets, rate limiters, and distributed locks.

```ruby
# config/initializers/redis.rb
$redis = Redis.new(url: ENV.fetch("REDIS_URL"))

# lib/redis_scripts.rb
module RedisScripts
  LUA_TRANSFER = <<~LUA
    local src, dest, amount = KEYS[1], KEYS[2], tonumber(ARGV[1])
    if redis.call('GET', src) == false or tonumber(redis.call('GET', src)) < amount then
      return {err = 'Insufficient funds'}
    end
    redis.call('DECRBY', src, amount)
    redis.call('INCRBY', dest, amount)
    return {ok = 'Transfer complete'}
  LUA
  SHA_TRANSFER = $redis.script(:load, LUA_TRANSFER)
end

# Usage
result = $redis.evalsha(RedisScripts::SHA_TRANSFER, keys: ["account:1:balance", "account:2:balance"], argv: [100])
puts result # => "Transfer complete"
```