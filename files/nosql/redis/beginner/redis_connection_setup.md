## 🔌 Connecting to Redis

Before you can use Redis in your Ruby app, install and require the `redis` gem. Then initialize a client by pointing at your Redis server. A simple connection test with `ping` confirms everything is up and running.

```ruby
# Gemfile
# gem 'redis'

require 'redis'

# Connect to local Redis (defaults to localhost:6379)
redis = Redis.new(host: "127.0.0.1", port: 6379)

# Test the connection
puts redis.ping  # => "PONG"
```