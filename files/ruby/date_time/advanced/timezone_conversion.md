## 🕰️ Timezone Conversion with ActiveSupport::TimeZone

When working with multiple timezones, avoid manual UTC offsets and leverage ActiveSupport::TimeZone for accurate DST handling. Use `in_time_zone`, `Time.zone.local` and `Time.zone.parse` to ensure conversions respect zone definitions.

```ruby
require 'active_support/all'

Time.zone = 'America/New_York'
# Parse a string in the configured zone
local_time = Time.zone.parse('2022-11-06 01:30')
# Convert a UTC time to the configured zone
utc_time   = Time.utc(2022, 11, 06, 5, 30)
ny_time    = utc_time.in_time_zone

puts local_time # => 2022-11-06 01:30:00 -0400
puts ny_time    # => 2022-11-06 01:30:00 -0500 (DST end)
```