## 🔄 Wait for Threads with #join

By default Ruby threads run independently, so your program may exit before they complete. Calling `join` on a thread blocks the caller until that thread finishes. This ensures your background tasks complete before moving on.

```ruby
worker = Thread.new do
  puts "Working..."
  sleep 2
  puts "Done work"
end

puts "Waiting for worker..."
worker.join
puts "All threads have finished."
```