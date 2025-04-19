## 🚧 Use `self.inherited` Hook in Classes

Ruby calls `self.inherited(subclass)` whenever a new subclass is created. This lets you register or initialize subclass-specific data automatically.

```ruby
class BaseCommand
  def self.inherited(child)
    puts "Registered command: #{child}"
  end
end

class StartCommand < BaseCommand; end  # Prints "Registered command: StartCommand"
```