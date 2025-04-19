## 🎩 Inline `rescue` in Operator Methods

Leverage the modifier form `rescue` inside operator definitions to gracefully handle exceptions (e.g., divisions by zero) without breaking fluent operator chains.

```ruby
class SafeNumber < Numeric
  def initialize(value)
    @value = value.to_f
  end

  def /(other)
    (@value / other.to_f) rescue Float::INFINITY
  end

  def to_f; @value; end
end

a = SafeNumber.new(10)
b = SafeNumber.new(0)
puts (a / b).to_f  # ⇒ Infinity
```