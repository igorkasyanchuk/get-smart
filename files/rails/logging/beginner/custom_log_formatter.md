## 🎨 Custom Log Formatter
You can implement a simple formatter to customize how your log messages look. Create a class that inherits from `Logger::Formatter` and assign it in your config.

```ruby
# lib/simple_formatter.rb
class SimpleFormatter < Logger::Formatter
  def call(severity, time, progname, msg)
    "[#{time.strftime('%Y-%m-%d %H:%M:%S')}] #{severity}: #{msg}\n"
  end
end

# config/application.rb
Rails.application.configure do
  config.log_formatter = SimpleFormatter.new
end
```
