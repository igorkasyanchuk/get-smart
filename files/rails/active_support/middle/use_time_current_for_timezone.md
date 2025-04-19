## 🕰️ Use `Time.current` for Time Zone Awareness
Rails applications configured with a time zone should use `Time.current` (an alias for `Time.zone.now`) instead of Ruby’s `Time.now`. This ensures times respect the app’s configured zone and daylight savings, preventing unexpected mismatches in logs or UI.

```ruby
Time.current       # => 2024-06-12 14:32:00 -0400 (ActiveSupport::TimeWithZone)
Time.now           # => 2024-06-12 18:32:00 UTC
```
