## 🛠 Stub Private Methods for Focused Unit Tests

Although stubbing private methods breaks encapsulation, it can be useful for isolating complex public-method logic. Use `allow_any_instance_of` with caution to keep tests maintainable.

```ruby
class PaymentProcessor
  def process(order)
    validate(order)
    charge(order)
  end

  private

  def validate(order)
    # complex rules
  end
end

allow_any_instance_of(PaymentProcessor).to receive(:validate)
processor = PaymentProcessor.new
processor.process(order)
# Now test only charge behavior without worrying about validate internals
```
