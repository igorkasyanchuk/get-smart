## 🕒 Getting Current Date and Time

Ruby provides two core classes for date and time: `Date` (for dates only) and `Time` (for full timestamps). Use `Date.today` to fetch just the date, and `Time.now` for both date and time with system timezone and precision.

```ruby
require 'date'

# Get current date
today = Date.today
puts today        # => 2023-03-15

# Get current date and time
time_now = Time.now
puts time_now     # => 2023-03-15 14:30:00 +0000
```