## 🛠️ Advanced Custom Log Formatter with Metadata
By subclassing `Logger::Formatter` (or using a proc), you can inject timestamps, severity colors, caller locations, and arbitrary metadata into each log line.

```ruby
# config/initializers/custom_logger.rb
class DetailedFormatter < Logger::Formatter
  SEVERITY_COLORS = {
    "INFO" => "\e[32m",
    "WARN" => "\e[33m",
    "ERROR" => "\e[31m"
  }

  def call(severity, time, progname, msg)
    color = SEVERITY_COLORS[severity] || "\e[0m"
    caller_loc = caller_locations(5,1).first
    formatted_time = time.utc.strftime("%Y-%m-%dT%H:%M:%S.%6NZ")
    metadata = {
      severity: severity,
      timestamp: formatted_time,
      file: caller_loc.path.split('/').last,
      line: caller_loc.lineno
    }

    "#{color}[#{metadata[:timestamp]}] #{severity} -- #{metadata[:file]}:#{metadata[:line]}: #{msg}\e[0m\n"
  end
end

Rails.logger.formatter = DetailedFormatter.new
```