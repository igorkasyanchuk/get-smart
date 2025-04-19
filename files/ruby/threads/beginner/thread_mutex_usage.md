## 🔒 Use Mutex to Prevent Race Conditions

When multiple threads modify shared data, you can get unpredictable results. A `Mutex` ensures only one thread at a time can run the critical section. Lock before the shared operation and unlock after.

```ruby
require 'thread'

counter = 0
mutex = Mutex.new

threads = 10.times.map do
  Thread.new do
    1000.times do
      mutex.synchronize do
        counter += 1
      end
    end
  end
end

threads.each(&:join)
puts "Final counter: #{counter}"  # Should reliably be 10000
```