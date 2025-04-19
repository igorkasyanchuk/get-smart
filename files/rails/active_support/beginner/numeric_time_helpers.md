## ⏱️ Leverage Numeric Time Helpers

ActiveSupport extends Ruby’s `Numeric` class with time-related methods like `hours`, `days`, and chaining methods like `ago` or `since`. This makes time calculations human-readable and concise.

```ruby
5.hours.ago     # => 2023-08-15 05:23:45 -0400
2.days.since    # => 2023-08-17 10:23:45 -0400
90.minutes.from_now  # => 2023-08-15 11:53:45 -0400
```
