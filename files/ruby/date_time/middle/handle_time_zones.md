## 🌐 Managing Time Zones with ActiveSupport

Keep your app’s times consistent by using Rails’ time zone helpers. Store UTC in the DB, then convert to users’ zones for display.

```ruby
# config/application.rb
t config.time_zone = 'Eastern Time (US & Canada)'
t config.active_record.default_timezone = :utc

# Converting
utc_time     = Time.current.utc             # Stored in UTC
local_time   = utc_time.in_time_zone        # => in "Eastern Time (US & Canada)"
puts local_time.strftime('%Y-%m-%d %H:%M %Z')

# Parsing in a zone
Time.find_zone('Tokyo').parse('2023-06-15 08:00')
```