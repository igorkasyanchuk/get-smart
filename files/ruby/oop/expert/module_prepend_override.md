## 🛠️ Overriding with Module#prepend for AOP-like Wrappers

Use `Module#prepend` to interpose behavior before or after existing methods, enabling Aspect-Oriented Programming patterns without altering the original method definitions directly.

```ruby
module Logging
  def process(*args)
    puts "[LOG] Starting process with #{args.inspect}"
    result = super
    puts "[LOG] Finished process: #{result.inspect}"
    result
  end
end

class Job
  prepend Logging

  def process(data)
    data.reverse
  end
end

Job.new.process('ruby')
# [LOG] Starting process with ["ruby"]
# [LOG] Finished process: "ybur"
```