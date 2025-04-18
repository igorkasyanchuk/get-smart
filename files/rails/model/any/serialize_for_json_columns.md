## 📦 Use `serialize` to store Ruby objects in text columns

To store hashes or arrays in a column, use `serialize`:

```ruby
class User < ApplicationRecord
  serialize :settings, Hash
end
```

Example:

```ruby
user.settings = { dark_mode: true, notifications: false }
user.save
```

Rails serializes and deserializes automatically. For newer versions consider using PostgreSQL's `jsonb` column for more flexibility.