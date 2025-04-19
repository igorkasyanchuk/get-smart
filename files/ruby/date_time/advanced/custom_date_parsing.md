## 📅 Custom Date Parsing with Fractional Seconds

Ruby’s built‑in parsers may drop subsecond precision. Use `DateTime.strptime` with `%L` or `%Q` to capture milliseconds and microseconds explicitly. This ensures you don’t lose critical timing data.

```ruby
require 'date'

# Parse ISO8601 with milliseconds
dt = DateTime.strptime('2022-03-13T15:45:30.123Z', '%Y-%m-%dT%H:%M:%S.%L%Z')
puts dt.strftime('%Y-%m-%d %H:%M:%S.%L %Z')
# => "2022-03-13 15:45:30.123 UTC"

# Parse with microseconds (Ruby 2.7+)
dt2 = DateTime.strptime('2022-03-13T15:45:30.123456Z', '%Y-%m-%dT%H:%M:%S.%6N%Z')
puts dt2.strftime('%Y-%m-%d %H:%M:%S.%6N %Z')
```