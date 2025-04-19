## 🔀 Alias Methods with `alias_method`

`alias_method` creates a copy of an existing method under a new name. This is handy if you want to wrap or override behavior but still call the original implementation.

```ruby
class Logger
  def log(msg)
    puts "Log: #{msg}"
  end

  alias_method :original_log, :log

  def log(msg)
    puts "[#{Time.now}]"
    original_log(msg)
  end
end

Logger.new.log("System started")
```