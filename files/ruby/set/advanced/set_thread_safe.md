## 🔒 Thread‐Safe Sets with concurrent‑ruby
Ruby’s `Set` isn’t thread‐safe by default. For multi‐threaded environments, use `Concurrent::Set` from the `concurrent‑ruby` gem. It provides atomic `add?`, `delete?`, and lock‐free reads to avoid race conditions.

```ruby
# Add to your Gemfile:
# gem 'concurrent-ruby'

require 'concurrent'

# Create a thread-safe set
safe_set = Concurrent::Set.new([1,2,3])

threads = 10.times.map do |i|
  Thread.new do
    100.times do |j|
      safe_set.add?(i*100 + j)
    end
  end
end

threads.each(&:join)

puts safe_set.size
# => 1000  # All adds completed without locks or races

# Atomic delete? returns true if element was present
puts safe_set.delete?(42) ? 'Removed' : 'Not present'
```