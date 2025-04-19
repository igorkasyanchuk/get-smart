## ➕ Performing Date Arithmetic

Ruby allows you to add or subtract days directly on `Date` objects, and subtracting one date from another yields a `Rational` difference in days.

```ruby
require 'date'

start_date = Date.new(2023, 3, 1)
end_date = start_date + 14  # adds 14 days
puts end_date       # => 2023-03-15

# Difference in days
days_between = end_date - start_date
puts days_between.to_i  # => 14
```