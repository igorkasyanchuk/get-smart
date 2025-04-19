## ⏱️ Non‑Blocking Lock with Mutex#try_lock

Use `Mutex#try_lock` when you want to attempt acquiring the lock without blocking the current thread. If the lock is unavailable, you can perform an alternative action or retry later, improving responsiveness in concurrent systems.

```ruby
require 'thread'
mutex = Mutex.new

def work(mutex)
  if mutex.try_lock
    begin
      puts "#{Thread.current.object_id}: Got the lock!"
      sleep(0.1)
    ensure
      mutex.unlock
    end
  else
    puts "#{Thread.current.object_id}: Could not get the lock, doing something else"
  end
end

threads = 5.times.map { Thread.new { 10.times { work(mutex) } } }
threads.each(&:join)
```