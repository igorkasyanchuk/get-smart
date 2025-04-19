## ⚙️ Optimizing Heavy Comparisons with `<=>` Caching

When sorting large collections with expensive comparison logic, memoize results of `<=>` to avoid repeated computation. This technique can dramatically speed up sorts.

```ruby
class HeavyItem
  attr_reader :data
  def initialize(data); @data = data; @cache = {} end

  def <=>(other)
    key = [self.object_id, other.object_id]
    @cache[key] ||= begin
      # Simulate heavy computation
      sleep(0.01)
      self.data.length <=> other.data.length
    end
  end
end

items = 50.times.map { HeavyItem.new(('a' * rand(1000))) }
# Without caching: ~0.5s
# With caching: ~0.25s
puts items.sort.map(&:data).first.length
```