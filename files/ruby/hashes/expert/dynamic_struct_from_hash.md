## 🏗️ Dynamic Struct Generation from Hash Keys

For performance‐sensitive cases, converting hashes to `Struct` offers faster dot‐notation access. Dynamically generate and cache classes based on key sets:

```ruby
module StructCache
  @cache = {}

  def self.from_hash(hash)
    keys = hash.keys.sort
    klass = @cache[keys] ||= Struct.new(*keys)
    klass.new(*keys.map { |k| hash[k] })
  end
end

data = { id: 1, name: 'Eve', age: 28 }
user = StructCache.from_hash(data)

puts user.name  #=> "Eve"
```

This yields near‐Struct performance for repeated access patterns and avoids creating new classes for identical key sets.