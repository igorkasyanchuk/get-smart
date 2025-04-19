## 🌌 Astronomical Calculations with Julian Day

Under the hood, Ruby’s `Date` and `DateTime` use Julian Day (JD) for calendar arithmetic. You can leverage `Date#jd` and `Date.jd` (or `Date#civil_to_jd`) to perform precise astronomical computations, such as calculating the date of an eclipse or converting to Modified Julian Day.

Example: convert a UTC timestamp into JD and back:

```ruby
require 'date'
# Convert a civil date to Julian day
jd = DateTime.new(2024, 6, 30, 12, 0, 0, '+00:00').jd
# Perform an offset (+1.5 days)
new_jd = jd + 1.5
# Convert back to DateTime
dt = DateTime.jd(new_jd)
puts "Original JD: #{jd}, After 1.5 days: #{dt.iso8601}"
```

This gives sub-day precision—essential for telescope scheduling or astrodynamics.