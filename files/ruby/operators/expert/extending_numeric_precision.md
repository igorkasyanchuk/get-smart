## 💡 Extending Numeric Operators for `BigDecimal` Precision

Use refinements or core extensions to automatically apply rounding or precision rules to decimal arithmetic by overriding core numeric operators.

```ruby
require 'bigdecimal'
require 'bigdecimal/util'

module PreciseMath
  refine BigDecimal do
    alias raw_mul :*

    def *(other)
      (raw_mul(other) * 1).round(4)
    end

    alias raw_div :/

    def /(other)
      (raw_div(other)).round(4)
    end
  end
end

using PreciseMath
puts BigDecimal('1.2345') * BigDecimal('2.1111')   # ⇒ 2.6050
puts BigDecimal('5') / BigDecimal('3')              # ⇒ 1.6667
```