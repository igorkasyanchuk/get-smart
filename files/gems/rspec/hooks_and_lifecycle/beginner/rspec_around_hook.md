## 🔄 Leverage `around` Hooks for Wrapping Logic

`around` hooks wrap the execution of each example, giving you full control before and after the example runs. This is useful for timing tests or managing transactions in a single place.

```ruby
RSpec.describe PaymentProcessor do
  around(:each) do |example|
    Database.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end

  it 'processes payment successfully' do
    expect(PaymentProcessor.new.process(amount: 50)).to be_truthy
  end
end
```
