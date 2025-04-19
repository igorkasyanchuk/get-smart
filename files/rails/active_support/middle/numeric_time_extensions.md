## ⏰ Numeric Time Extensions
ActiveSupport adds intuitive time methods to Numeric, allowing you to write expressive time calculations. Instead of manually computing seconds, call methods like `days`, `hours`, or `minutes` on integers and chain `ago`, `from_now`, `since`, or `until` for clear intent.

```ruby
5.days.ago         # => 2024-06-07 14:32:00 -0400
3.hours.from_now   # => 2024-06-12 17:32:00 -0400
1.week.since(Time.current)  # => time one week ahead
```
