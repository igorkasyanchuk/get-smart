## 🎯 Dynamic Queue Sharding for High Throughput

Shard your workload across N queues by hashing a routing key (e.g., user ID). This horizontally scales consumers and reduces lock contention. You can add or remove shards at runtime with minimal disruption by using a rendezvous hash.

```ruby
# lib/solid_queue/sharder.rb
require 'rendezvous_hash'

class SolidQueue::Sharder
  def initialize(nodes)
    @hash = RendezvousHash.new(nodes)
  end

  def shard_for(key)
    @hash.get_node(key)
  end
end

# config/initializers/solid_queue.rb
nodes = Array.new(8) { |i| "critical_shard_#{i}" }
SHARDER = SolidQueue::Sharder.new(nodes)

# Enqueue hook
client = SolidQueue::Client.new
user_id = current_user.id
shard = SHARDER.shard_for(user_id)
client.enqueue('ProcessUserData', {user_id: user_id}, queue: shard)
```