## 🧵 Create a Basic Thread

You can spin off concurrent work by calling `Thread.new` and providing a block. This lets Ruby run that block in parallel with your main program. Use it for non-blocking tasks like I/O or background processing.

```ruby
thread = Thread.new do
  5.times do |i|
    puts "Thread says: #{i}"
    sleep 0.5
  end
end

puts "Main thread continues..."
thread.join  # Wait for the thread to finish if needed
```