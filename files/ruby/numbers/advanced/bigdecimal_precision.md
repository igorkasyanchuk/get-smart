## 🧮 Handling High-Precision Arithmetic with BigDecimal
BigDecimal offers arbitrary-precision arithmetic ideal for financial and scientific calculations where Float falls short due to rounding errors. You can specify a custom precision when creating BigDecimal objects and leverage various rounding modes for controlled results.

```ruby
require 'bigdecimal'
require 'bigdecimal/util'

# Initialize BigDecimal with 20 digits of precision
a = BigDecimal('1', 20) / BigDecimal('3', 20)
puts a.to_s('F') # => 0.33333333333333333333

# Round to 10 decimal places using half-even (banker's) rounding
d = a.round(10, BigDecimal::ROUND_HALF_EVEN)
puts d.to_s('F') # => 0.3333333333
```
