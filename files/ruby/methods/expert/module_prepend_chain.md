## 🔀 Applying Behaviors Early with Module#prepend
`prepend` injects a module before the class in the method lookup chain, enabling wrappers around existing methods without aliasing. This pattern is ideal for cross-cutting concerns like logging or authorization.

```ruby
module Logging
  def process(*args)
    puts "Calling process with #{args.inspect}"
    result = super
    puts "Result: #{result.inspect}"
    result
  end
end

class Processor
  prepend Logging

  def process(data)
    data.map(&:to_s)
  end
end

processor = Processor.new
processor.process([1,2,3])
# Output:
# Calling process with [[1, 2, 3]]
# Result: ["1", "2", "3"]
```