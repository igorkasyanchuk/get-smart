## 🗝️ Custom Key‐Based Deduplication in Set
By default, `Set` uses each object’s `hash`/`eql?` to decide uniqueness. You can subclass `Set` to accept a key‐extractor block, allowing you to dedupe by any attribute. This technique is useful when you need a “set” of complex objects keyed by a single field.

```ruby
require 'set'

class KeyedSet < Set
  def initialize(enum = nil, &key_proc)
    @key_proc = key_proc || proc { |x| x }
    super(enum)
  end

  def add(obj)
    key = @key_proc.call(obj)
    # Remove any existing element with the same key
    existing = detect { |e| @key_proc.call(e) == key }
    delete(existing) if existing
    super(obj)
  end
end

# Usage: dedupe User instances by email
users = [
  OpenStruct.new(name: 'Alice', email: 'a@x.com'),
  OpenStruct.new(name: 'Alicia', email: 'a@x.com'),
  OpenStruct.new(name: 'Bob',   email: 'b@x.com')
]

set = KeyedSet.new(users) { |u| u.email }
puts set.to_a.map(&:name)
# => ["Alicia", "Bob"]  # keeps the last one for each email
```