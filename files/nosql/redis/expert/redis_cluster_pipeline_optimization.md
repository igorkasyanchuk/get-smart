## 🚀 Optimize Bulk Writes with Cluster Pipeline and Auto‑Retry
When using Redis Cluster, commands span multiple hash slots and nodes. The `redis-rb` client’s pipelining in cluster mode doesn’t automatically handle MOVED redirects. By wrapping your pipeline in retry logic and rescanning slot mappings, you can maximize throughput and resilience during topology changes.

```ruby
# Bulk write with resilient cluster pipeline
def cluster_bulk_write(pairs)
  retries = 0
  begin
    $redis.cluster_async do |conn|
      conn.pipelined do |pipeline|
        pairs.each { |key, value| pipeline.set(key, value) }
      end
    end
  rescue Redis::CommandError => e
    raise unless e.message.start_with?("MOVED")
    retries += 1
    raise if retries > 3
    $redis.cluster.reload_slots_cache!
    retry
  end
end

# Usage
data = Array.new(1_000) { |i| ["user:#{i}", {name: "User#{i}"}.to_json] }
cluster_bulk_write(data)
```