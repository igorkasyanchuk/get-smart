## 🔒 Building a Thread‑Safe Set
Ruby’s `Set` isn’t thread‑safe by default. For high‑concurrency environments, wrap operations in a mutex (or use `Monitor`) so that readers and writers don’t interleave and corrupt internal state.

```ruby
require 'set'
require 'monitor'

class ConcurrentSet < Set
  def initialize(enum = nil)
    super
    @monitor = Monitor.new
  end

  [:add?, :delete, :include?, :merge, :subtract].each do |method_name|
    define_method(method_name) do |*args, &block|
      @monitor.synchronize { super(*args, &block) }
    end
  end
end

cs = ConcurrentSet.new
threads = 10.times.map do
  Thread.new do
    1000.times { |i| cs.add?(i) }
  end
end
threads.each(&:join)
puts cs.size  # => 1000 without race conditions
```