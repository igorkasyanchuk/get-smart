## 🧮 Accurate Decimal with BigDecimal

Use `BigDecimal` for financial or scientific calculations where floating‑point errors are unacceptable. Always `require 'bigdecimal'` (and `'bigdecimal/util'` for String conversions).

```ruby
require 'bigdecimal'
require 'bigdecimal/util'

price = '19.99'.to_d
tax_rate = '0.075'.to_d

total = price + (price * tax_rate)
puts total.to_s('F')
# => "21.48825"
```