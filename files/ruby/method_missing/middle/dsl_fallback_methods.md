## 🛠️ Creating a Simple DSL with Fallback Methods
method_missing shines in DSL design by capturing arbitrary method calls and mapping them to configuration or commands. This pattern simplifies building expressive internal DSLs without predefining each method.

```ruby
class SimpleConfig
  def initialize
    @settings = {}
  end

  def method_missing(name, *args)
    key = name.to_s
    if key.end_with?('=')
      @settings[key.chomp('=')] = args.first
    elsif @settings.key?(key)
      @settings[key]
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    true
  end
end

config = SimpleConfig.new
env = config
env.timeout = 30
env.timeout  # => 30
```