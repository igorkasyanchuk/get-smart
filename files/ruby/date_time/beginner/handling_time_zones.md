## 🌐 Handling Time Zones

Working with time zones ensures your app displays correct local times. Use `Time.now.getlocal` or create a `Time`/`DateTime` object with an offset.

```ruby
# Current time in local zone
time_local = Time.now.getlocal
puts time_local   # => 2023-03-15 10:30:00 -0400

# Create a Time with specific offset
time_with_offset = Time.new(2023, 3, 15, 14, 30, 0, "+02:00")
puts time_with_offset  # => 2023-03-15 14:30:00 +0200

# DateTime with zone
dt = DateTime.new(2023,3,15,14,30,0,"-05:00")
puts dt           # => 2023-03-15T14:30:00-05:00
```