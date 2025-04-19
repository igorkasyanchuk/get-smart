## 🔄 Wait for Threads with `join`

After spawning threads for concurrent work, call `Thread#join` to wait for them to finish before proceeding. This ensures shared resources remain consistent once all threads complete.

```ruby
require 'thread'

mutex = Mutex.new
results = []

threads = 4.times.map do |i|
  Thread.new do
    sleep(rand * 0.1)  # simulate work
    mutex.synchronize { results << "Result from thread #{i}" }
  end
end

# Wait for all threads to finish	hreads.each(&:join)
puts results  # => ["Result from thread 0", "Result from thread 1", ...]
```