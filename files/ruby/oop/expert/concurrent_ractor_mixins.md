## ⚛️ Concurrency-safe Mixins with Ractors and Clone

Design mixins that can work across Ractors without sharing mutable state. Use `#clone` to deep-copy module state and freeze constants to avoid cross-Ractor violations.

```ruby
module Counter
  def increment
    @count ||= 0
    @count += 1
  end

  def value
    @count
  end
end

ractor1 = Ractor.new do
  c = Counter.clone
  c.extend(Counter)
  3.times { c.increment }
  c.value
end

ractor2 = Ractor.new do
  c = Counter.clone
  c.extend(Counter)
  2.times { c.increment }
  c.value
end

puts ractor1.take  # => 3
puts ractor2.take  # => 2
```