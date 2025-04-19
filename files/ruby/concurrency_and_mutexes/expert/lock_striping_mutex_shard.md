## 🔒 Lock Striping with Sharded Mutex Pools

For high‐throughput scenarios with shared hash maps or counters, use lock striping to reduce contention. By partitioning your resource into N buckets each guarded by its own `Mutex`, you enable parallel writes on different shards while preserving thread safety.

```ruby
class ShardedCounter
  SHARD_COUNT = 8

  def initialize
    @shards = Array.new(SHARD_COUNT) { { count: 0 } }
    @mutexes = Array.new(SHARD_COUNT) { Mutex.new }
  end

  def increment(key)
    idx = shard_index(key)
    @mutexes[idx].synchronize do
      @shards[idx][:count] += 1
    end
  end

  def count(key)
    idx = shard_index(key)
    @mutexes[idx].synchronize { @shards[idx][:count] }
  end

  private

  def shard_index(key)
    Zlib.crc32(key.to_s) % SHARD_COUNT
  end
end
```

This pattern scales writes almost linearly with the number of shards. Tune `SHARD_COUNT` to the number of cores or expected contention domains.