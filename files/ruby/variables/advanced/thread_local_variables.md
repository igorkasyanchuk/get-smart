## 🧵 Leveraging Thread-Local Variables for Concurrency

Thread-local storage lets each thread maintain isolated state, preventing shared‑memory conflicts and enabling context‑specific data like request IDs or logging metadata. Store values in `Thread.current` and retrieve them anywhere in that thread without passing arguments through call chains.

```ruby
require 'securerandom'

threads = 3.times.map do |i|
  Thread.new do
    # Assign a unique identifier per thread
    Thread.current[:request_id] = SecureRandom.uuid

    # Simulate work
    sleep(rand * 0.1)
    puts "Thread #{i} – Request ID: #{Thread.current[:request_id]}"
  end
end

threads.each(&:join)
```