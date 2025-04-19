## ♾️ Custom Equality and Hashing for Complex Objects
When you store custom objects in a Set, Ruby uses `hash` and `eql?` to decide uniqueness. By overriding these methods you can group objects by any combination of attributes, even nested structures. This lets you dedupe complex data without extra iteration.

```ruby
require 'set'

class Event
  attr_reader :name, :timestamp, :metadata
  def initialize(name, timestamp, metadata = {})
    @name, @timestamp, @metadata = name, timestamp, metadata
  end

  # Only name and date portion of timestamp matter for uniqueness
  def hash
    [name, timestamp.to_date].hash
  end

  def eql?(other)
    other.is_a?(Event) && name == other.name && timestamp.to_date == other.timestamp.to_date
  end
end

events = Set.new
# Two events at different times on same day are treated as duplicates
events << Event.new('deploy', Time.now)
events << Event.new('deploy', Time.now - 3600)

puts events.size  # => 1
```