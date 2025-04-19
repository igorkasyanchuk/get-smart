## 🔧 Method Call Logging

Wrap existing instance methods with custom behavior like logging without altering the original definitions. Using `define_method` and `alias_method` together lets you inject code before or after the original method runs.

```ruby
class Service
  def perform(task)
    # original implementation
    puts "Performing \\#{task}..."
  end

  # Inject logging around `perform`
  original = instance_method(:perform)
  define_method(:perform) do |task|
    puts "[LOG] Starting perform(#{task})"
    result = original.bind(self).call(task)
    puts "[LOG] Finished perform(#{task})"
    result
  end
end

svc = Service.new
svc.perform("cleanup")
# [LOG] Starting perform(cleanup)
# Performing cleanup...
# [LOG] Finished perform(cleanup)
```

This pattern lets you wrap or decorate methods at runtime while preserving the original implementation.