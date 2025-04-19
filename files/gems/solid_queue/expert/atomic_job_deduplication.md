## 🔒 Atomic Job Deduplication with Redis Lua

To prevent duplicate jobs under high concurrency, use Redis Lua scripts for atomic checks and inserts. This ensures that checking for existence and pushing to the queue happens as one indivisible operation. 

```ruby
# config/initializers/solid_queue.lua_deduplication.rb
DEDUP_SCRIPT = <<~LUA
  if redis.call('SISMEMBER', KEYS[1], ARGV[1]) == 1 then
    return 0
  else
    redis.call('SADD', KEYS[1], ARGV[1])
    redis.call('LPUSH', KEYS[2], ARGV[1])
    return 1
  end
LUA

class SolidQueue::Client
  def enqueue_unique(job_id, payload, queue:)
    dedup_key = "dedup:#{queue}"
    queue_key = "queue:#{queue}"
    result = redis.eval(DEDUP_SCRIPT, keys: [dedup_key, queue_key], argv: [job_id])
    result == 1
  end
end

# Usage
client = SolidQueue::Client.new
client.enqueue_unique("job-123", { action: 'process' }, queue: 'critical')
```