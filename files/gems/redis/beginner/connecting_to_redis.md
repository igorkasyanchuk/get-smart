## 🔌 Connecting to Redis

Connecting to Redis is the first step to start storing data. Using the `redis` gem, you can instantiate a client that points to your local or remote server. Here's how to establish a basic connection.

```ruby
require 'redis'

# Connect to local Redis server on default port
redis = Redis.new(host: "127.0.0.1", port: 6379)

# Test connection
redis.ping # => "PONG"
```
