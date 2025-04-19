## ⚙️ Multi‑Database and Sharding

Rails 6+ supports multiple databases and horizontal sharding out of the box. Configure separate roles (`writing`, `reading`) or shards for scaling reads and writes.

```yaml
development:
  primary:
    database: app_primary
  primary_replica:
    database: app_primary_replica
    replica: true
  animals_shard:
    database: app_animals_shard
``` 
```ruby
# Usage:
ActiveRecord::Base.connected_to(role: :reading) do
  User.first
end
ActiveRecord::Base.connected_to(shard: :animals_shard) do
  Animal.create(name: "Lion")
end
```