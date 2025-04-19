## 🧮 High‑Precision DateTime Arithmetic Using Rational

Floating‑point arithmetic can introduce rounding errors in date math. Use `Rational` to represent fractions of a day exactly (1 day = 1, so 1 second = 1/86_400). This preserves nanosecond precision over long intervals.

```ruby
require 'date'

start_dt = DateTime.now
# Add 1.5 seconds precisely
interval = Rational(3, 2) / 86_400
next_dt  = start_dt + interval

diff_seconds = (next_dt - start_dt) * 86_400
puts diff_seconds.to_f # => 1.5
```