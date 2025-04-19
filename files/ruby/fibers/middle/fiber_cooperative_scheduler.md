## ⏭️ Implementing a Simple Cooperative Scheduler
You can build a basic scheduler by maintaining a queue of fibers and rotating through them. Each fiber yields control voluntarily, enabling cooperative multitasking within a single thread. This pattern is ideal for lightweight task switching without the overhead of threads.

```ruby
require 'thread'

class Scheduler
  def initialize
    @queue = []
  end

  def schedule(&block)
    @queue << Fiber.new { block.call; Fiber.yield }
  end

  def run
    until @queue.empty?
      f = @queue.shift
      f.resume
      @queue << f unless f.alive?
    end
  end
end

sched = Scheduler.new
tasks = [1,2,3]
tasks.each do |i|
  sched.schedule { puts "Task #{i} running" }
end
sched.run
```