## 🧮 Advanced BigDecimal Precision Control

Ruby’s BigDecimal gives you true arbitrary-precision arithmetic, but by default it uses a modest number of significant digits. You can globally tune precision for all new BigDecimal instances with `BigDecimal.limit`, and configure rounding modes per calculation via `BigDecimal.mode`. This is invaluable when you need consistent rounding behavior across complex financial algorithms.

```ruby
require 'bigdecimal'
require 'bigdecimal/util'

# Set default precision to 30 significant digits
BigDecimal.limit(30)

# Configure rounding mode: HALF_UP for typical financial rounding
BigDecimal.mode(BigDecimal::ROUND_HALF_UP, BigDecimal::ROUND_DIGITS)

# Now every new BigDecimal uses 30 digits and HALF_UP
a = BigDecimal("1.2345678901234567890123456789")
b = BigDecimal("2.3456789012345678901234567890")

sum = a + b
puts sum.to_s("F")  # => high‑precision accurate result
```