## 🛠️ Passing a Lambda to a Method

Lambdas can also be passed into methods like procs, enforcing their parameter rules. This pattern is great for injecting custom behavior while ensuring argument correctness.

```ruby
def perform(task, &block)
  block.call(task)
end

log_task = ->(t) { puts "Performing #{t.upcase}" }
perform("cleanup", &log_task)
# => Performing CLEANUP
```