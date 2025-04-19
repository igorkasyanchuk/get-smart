## 🧵 Isolating State with Thread-Local and Fiber-Local Variables

For highly concurrent systems, leveraging `Thread` and `Fiber` locals prevents cross-context pollution while sharing APIs. Store transient request IDs, database sessions, or actor mailbox queues in `Thread.current` or `Fiber.current[]` for zero-dependency contextual data without global vars.

```ruby
# Thread-local storage example
th = Thread.new do
  Thread.current[:request_id] = SecureRandom.uuid
  puts "Thread ID: #{Thread.current[:request_id]}"
end
th.join

# Fiber-local storage example
fiber = Fiber.new do
  Fiber.current[:db] = ActiveRecord::Base.connection_pool.checkout
  puts "Got DB session: #{Fiber.current[:db].object_id}"
  ActiveRecord::Base.connection_pool.checkin(Fiber.current[:db])
end
fiber.resume
```