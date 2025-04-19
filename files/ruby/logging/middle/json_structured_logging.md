## 🛠️ Emit Structured JSON Logs for Easy Parsing

JSON-formatted logs integrate seamlessly with log management systems like ELK or Datadog. Using a structured logger makes it trivial to query specific fields such as user IDs or transaction statuses.

```ruby
require 'json'
logger = Logger.new(STDOUT)
logger.formatter = proc do |severity, datetime, progname, msg|
  JSON.dump({
    severity: severity,
    time: datetime.iso8601,
    progname: progname,
    message: msg
  }) + "\n"
end

logger.info("Payment processed", user_id: current_user.id, amount: order.total)
```

This approach yields one JSON object per line, enabling advanced log searches and metric extraction.