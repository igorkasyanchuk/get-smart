## 🔍 Parsing and Applying ISO8601 Durations with the iso8601 Gem

Ruby doesn’t support ISO8601 durations out of the box. The `iso8601` gem lets you parse `PnYnMnDTnHnMnS` strings and convert them to seconds or directly apply them to a `Time` or `DateTime`.

```ruby
# Add to your Gemfile:
# gem 'iso8601'
require 'iso8601'
require 'date'

duration = ISO8601::Duration.new('P1Y2M10DT2H30M')
start_dt = DateTime.parse('2022-01-01T00:00:00Z')
# Compute end datetime
end_dt   = start_dt >> (duration.years * 12 + duration.months)
end_dt   = end_dt + Rational(duration.days, 1)
end_dt   = end_dt + Rational(duration.hours * 3600 + duration.minutes * 60 + duration.seconds, 86_400)

puts end_dt.iso8601
# => "2023-03-11T02:30:00+00:00"
```