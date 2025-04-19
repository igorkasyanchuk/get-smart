## 🔄 Using Fibers for Cooperative Concurrency

Combine Fibers and blocks to write asynchronous-style code without callbacks. A Fiber can yield back to the caller at pause points in the block, enabling cooperative multitasking within a single thread.

```ruby
def async_task(&block)
  f = Fiber.new do
    block.call
    :done
  end
  f.resume until f.alive? == false
end

async_task do
  puts "Step 1"
  Fiber.yield
  puts "Step 2"
  Fiber.yield
  puts "Finished"
end
```