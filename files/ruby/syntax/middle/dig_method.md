## 🕳️ Accessing Nested Data with `dig`

`dig` allows safe retrieval of deeply nested values from hashes and arrays without intermediate `nil` checks. It returns `nil` if any level is missing.

```ruby
config = { db: { host: "localhost", credentials: { user: "admin" } } }
# Without dig:
user = config[:db] && config[:db][:credentials] && config[:db][:credentials][:user]

# With dig:
user = config.dig(:db, :credentials, :user)
# => "admin"

# If a key is missing:
config.dig(:db, :missing, :key) #=> nil
```