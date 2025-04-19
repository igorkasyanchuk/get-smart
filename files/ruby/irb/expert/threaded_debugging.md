## 🧠 Multi-Threaded Debugging with binding.irb
Insert `binding.irb` in concurrent code paths to drop into IRB with the current thread's context. This is invaluable for dissecting race conditions.

```ruby
require 'irb'

threads = 3.times.map do |i|
  Thread.new do
    sleep rand
    puts "Thread #{i} before debug"
    binding.irb  # REPL in this thread
    puts "Thread #{i} after debug"
  end
end
threads.each(&:join)
```

When execution hits `binding.irb`, you get a full REPL locked to that thread. Inspect local vars, step through state, then type `exit` to resume.