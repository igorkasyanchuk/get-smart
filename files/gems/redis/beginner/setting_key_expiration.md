## ⏱️ Setting Key Expiration

To avoid stale data, you can set a time-to-live (TTL) for keys. Once expired, Redis will automatically delete the key.

```ruby
# Set key with expiration (in seconds)
redis.set("session_token", "xyz123")
redis.expire("session_token", 3600) # Expires in 1 hour

# Check remaining TTL
ttl = redis.ttl("session_token")
puts ttl # => seconds until expiration
```
