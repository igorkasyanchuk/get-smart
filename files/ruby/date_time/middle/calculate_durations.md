## ➖ Calculating Durations and Differences

Compute intervals between `Date` or `Time` objects with subtraction and leverage ActiveSupport for human‑readable durations. You can also chain durations like `2.days + 3.hours`.

```ruby
require 'date'
start_date = Date.new(2023,6,1)
end_date   = Date.new(2023,6,15)
puts (end_date - start_date).to_i    # => 14 days

# With ActiveSupport in Rails or require 'active_support'
require 'active_support/all'
duration = 2.days + 5.hours + 30.minutes
future_time = Time.current + duration
puts future_time                    # => now + 2 days + 5.5 hours
```