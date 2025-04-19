## 🛡️ Using Sets with Custom Objects

To ensure uniqueness of custom objects in a Set, override `hash` and `eql?`. This tells Ruby which attributes define object identity.

```ruby
require 'set'

class User
  attr_reader :id, :name

  def initialize(id, name)
    @id, @name = id, name
  end

  def hash
    id.hash
  end

  def eql?(other)
    other.is_a?(User) && id == other.id
  end

  def to_s
    "#{name}(#{id})"
  end
end

users = Set.new
u1 = User.new(1, "Alice")
u2 = User.new(1, "Alicia")
users << u1
users << u2
puts users.to_a  # => [Alice(1)] — duplicates by id are collapsed
```