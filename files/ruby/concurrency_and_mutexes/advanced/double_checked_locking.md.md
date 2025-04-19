## 🔄 Double-Checked Locking for Lazy Initialization

To avoid the overhead of locking on every access when lazily initializing a resource, use double-checked locking. This pattern checks if the instance exists before and after acquiring the lock, ensuring thread safety and reducing contention.

```ruby
class ExpensiveResource
  @instance = nil
  @mutex    = Mutex.new

  class << self
    def instance
      # First check without locking
      return @instance if @instance

      # Only one thread initializes
      @mutex.synchronize do
        # Second check inside lock
        @instance ||= new
      end
    end

    private :new
  end
end

# Usage
threads = 5.times.map do
  Thread.new { p ExpensiveResource.instance.object_id }
end
threads.each(&:join)
```

All threads will print the same object ID, and only one `new` call occurs.