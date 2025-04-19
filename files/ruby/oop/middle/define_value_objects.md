## 💎 Encapsulate Data in Value Objects

For domain data that’s immutable and compared by value, build custom value objects. Implement `eql?` and `hash` so they behave predictably in collections.

```ruby
class Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount, @currency = amount, currency
    freeze
  end

  def ==(other)
    other.is_a?(Money) && amount == other.amount && currency == other.currency
  end
  alias eql? ==

  def hash
    [amount, currency].hash
  end
end

m1 = Money.new(100, 'USD')
m2 = Money.new(100, 'USD')
puts m1 == m2 # true
```