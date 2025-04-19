## ✨ Formatting Dates and Times

Use `strftime` to output dates and times in custom formats. You pass a format string with percent directives to control output.

```ruby
require 'date'

date = Date.new(2023, 3, 15)
time = Time.new(2023, 3, 15, 14, 30)

# Date formatting
echo = date.strftime("%B %d, %Y")
puts echo         # => "March 15, 2023"

# Time formatting
puts time.strftime("%Y-%m-%d %H:%M:%S %Z")
# => "2023-03-15 14:30:00 UTC"
```