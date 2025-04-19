## 📅 Parsing Date Strings

Converting user input or string data into `Date` or `DateTime` objects lets you perform calculations and validations. Ruby’s `parse` methods handle common formats automatically.

```ruby
require 'date'

# Parse a simple date string
date = Date.parse('2023-03-15')
puts date         # => #<Date: 2023-03-15 ((2459993j,0s,0n),+0s,2299161j)>

# Parse ISO 8601 timestamp to DateTime
datetime = DateTime.parse('2023-03-15T14:30:00+02:00')
puts datetime     # => 2023-03-15T14:30:00+02:00
```