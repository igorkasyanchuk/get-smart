## 🚀 Enumerating Business Days with Custom Holiday Calendar

Generate a range of business days by filtering out weekends and custom holidays. Using Ruby’s range and `#select` makes the logic declarative and thread‑safe.

```ruby
require 'date'

def business_days(start_date, end_date, holidays = [])
  (start_date..end_date).select do |d|
    (1..5).cover?(d.wday) && !holidays.include?(d)
  end
end

holidays = [Date.new(2022,12,25), Date.new(2023,1,1)]
range    = business_days(Date.new(2022,12,20), Date.new(2023,1,5), holidays)
puts range
# => [2022-12-20, ..., 2022-12-23, 2022-12-26, ..., 2022-12-30, 2023-01-02, ..., 2023-01-05]
```