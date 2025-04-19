## 🌪️ Streaming Unique Values with Enumerator::Lazy
For very large or infinite streams, you can combine `Set` with `Enumerator::Lazy` to emit each unique item exactly once without loading the full stream into memory. This approach suits log processing or real‑time data.

```ruby
require 'set'

def unique_stream(enum)
  seen = Set.new
  enum.lazy.select do |item|
    # `.add?` returns nil if already present
    seen.add?(item)
  end
end

# Simulate infinite sensor readings with duplicates
readings = Enumerator.produce { rand(1..5) }

# Take first 10 unique readings
first_ten = unique_stream(readings).first(10)
puts "10 unique readings: #{first_ten.inspect}"
```