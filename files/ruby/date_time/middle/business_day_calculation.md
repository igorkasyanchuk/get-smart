## 📊 Skipping Weekends for Business-Day Arithmetic

Implement simple business‑day addition by advancing dates and skipping weekends. For larger needs, consider the `business_time` gem.

```ruby
require 'date'

def add_business_days(start_date, days)
  date = start_date
  days.times do
    date += 1
    date += 2 if date.saturday?      # skip to Monday
    date += 1 if date.sunday?        # skip Sunday
  end
  date
end

puts add_business_days(Date.new(2023,6,15), 3)
# => skips weekend if necessary
```