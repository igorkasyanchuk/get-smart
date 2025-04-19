## 🎯 Supervise and Propagate Errors Across Fibers
Implement a supervisor fiber to catch and route exceptions from child fibers, allowing you to restart or log failures. This pattern ensures your system remains responsive even if individual fibers crash.

```ruby
class FiberSupervisor
  def initialize
    @workers = []
  end

  def spawn(&block)
    f = Fiber.new do
      begin
        block.call
      rescue => e
        puts "Worker failed: #{e.class} - #{e.message}"
        # Optionally restart or escalate
      end
    end
    @workers << f
    f.resume
  end

  def run
    loop { @workers.reject!(&:dead?) }
  end
end

supervisor = FiberSupervisor.new
supervisor.spawn { raise "Boom" }
supervisor.spawn { puts "All good" }
supervisor.run
```
