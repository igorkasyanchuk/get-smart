## 📅 Custom Date/Time Parsing with `strptime`

When you need to parse non‑standard date/time strings reliably, use `Date.strptime` or `Time.strptime` with a format directive. This avoids ambiguities that `Date.parse` or `Time.parse` may introduce.

```ruby
require 'date'
# Parse a day-month-year string
date = Date.strptime('31-12-2023', '%d-%m-%Y')
puts date  # => 2023-12-31

# Parse time with hours, minutes, seconds
require 'time'
time = Time.strptime('2023/12/31 23:59:59', '%Y/%m/%d %H:%M:%S')
puts time  # => 2023-12-31 23:59:59 +0000
```