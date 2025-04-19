## 🔄 Favor Composition Over Inheritance

Inheritance can tightly couple classes; prefer composition to delegate responsibilities to collaborator objects. This increases flexibility and testability.

```ruby
class Logger
  def log(message)
    puts "LOG: \\#{message}"
  end
end

class Service
  def initialize(logger = Logger.new)
    @logger = logger
  end

  def perform
    @logger.log("Service started")
    # ...
  end
end
```