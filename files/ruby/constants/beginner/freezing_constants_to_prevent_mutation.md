## 🛡️ Freezing Constants to Prevent Mutation

Constants can hold mutable objects like arrays or hashes. To avoid accidental modifications, use `#freeze` so that attempts to change the object raise an error.

```ruby
# Without freezing
ROLES = ['admin', 'user']
ROLES << 'guest'
puts ROLES.inspect  # => ["admin", "user", "guest"]

# With freezing
PERMISSIONS = { read: true, write: false }.freeze
PERMISSIONS[:delete] = true
# => RuntimeError: can't modify frozen Hash

# You can also freeze nested objects
SETTINGS = {
  retries: 3,
  backoff: [1, 2, 4]
}.freeze
SETTINGS[:backoff] << 8
# => works unless you freeze the inner array too
SETTINGS[:backoff].freeze
SETTINGS[:backoff] << 8
# => RuntimeError: can't modify frozen Array
```