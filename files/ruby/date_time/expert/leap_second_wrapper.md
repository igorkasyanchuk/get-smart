## 🎛️ Custom Leap Second Handling

Ruby’s core `Time`/`DateTime` ignores leap seconds, leading to subtle off‑by‑one-second errors in physics or telecom domains. Maintain an external leap‑second table (from IERS) and wrap conversions to adjust UTC ↔ TAI properly.

Example: lightweight leap‑second wrapper:

```ruby
require 'date'
LEAP_SECONDS = {
  DateTime.new(2016,12,31,23,59,60,'+00:00') => 1,
  # ... load from official table ...
}

class LeapTime
  def initialize(dt)
    @dt = dt
  end

  # Returns TAI (International Atomic Time) offset in seconds
  def to_tai
    offset = LEAP_SECONDS.select { |d,_| d <= @dt }.values.sum
    @dt.to_time.to_i + offset
  end

  # Convert TAI seconds back to UTC DateTime
  def self.from_tai(tai_sec)
    # reverse lookup: subtract cumulative leap seconds
    dt = Time.at(tai_sec).utc.to_datetime
    corrections = LEAP_SECONDS.select { |d,_| d <= dt }.values.sum
    (Time.at(tai_sec - corrections).utc).to_datetime
  end
end

dt = DateTime.now.new_offset(0)
puts "TAI seconds: #{LeapTime.new(dt).to_tai}"
```
