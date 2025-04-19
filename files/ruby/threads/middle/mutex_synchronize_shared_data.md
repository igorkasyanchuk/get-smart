## 🔒 Synchronize with Mutex

When multiple threads modify shared state, wrap critical sections in a `Mutex` to avoid race conditions. Use `Mutex#synchronize` to automatically lock and unlock around your code block.

```ruby
counter = 0
mutex   = Mutex.new

threads = 10.times.map do
  Thread.new do
    1_000.times do
      mutex.synchronize do
        counter += 1
      end
    end
  end
end

threads.each(&:join)
puts counter  # => 10000
```

This pattern ensures only one thread at a time updates `counter`, preventing lost increments.