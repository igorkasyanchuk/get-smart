## 📊 High-Performance Unique Counters with HyperLogLog

Use Redis HyperLogLog to maintain approximate unique counts with minimal memory (~12kB) even at billions of distinct elements. Perfect for analytics, tracking UVs, or deduplicated metrics.

```ruby
# app/services/unique_user_counter.rb
class UniqueUserCounter
  PREFIX = 'users:uv:'

  def track(user_id, date = Date.today)
    key = PREFIX + date.to_s
    REDIS.pfadd(key, user_id)
    REDIS.expire(key, 86_400 * 30) # retain for 30 days
  end

  def count(date = Date.today)
    key = PREFIX + date.to_s
    REDIS.pfcount(key)
  end

  def multi_day_count(*dates)
    keys = dates.map { |d| PREFIX + d.to_s }
    temp = PREFIX + 'tmp:' + SecureRandom.uuid
    REDIS.pfmerge(temp, *keys)
    count = REDIS.pfcount(temp)
    REDIS.del(temp)
    count
  end
end
```
