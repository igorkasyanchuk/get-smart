## 📂 Leveraging Context Blocks

`context` blocks group tests under specific conditions or states, improving clarity. Use descriptive context names and nest them to reflect different preconditions or inputs.

```ruby
RSpec.describe PaymentProcessor do
  context "when the card is valid" do
    let(:card) { Card.new(valid: true) }

    it "processes payment successfully" do
      expect(subject.process(card)).to be_truthy
    end
  end

  context "when the card is expired" do
    let(:card) { Card.new(expired: true) }

    it "raises an expiration error" do
      expect { subject.process(card) }.to raise_error(ExpiredCardError)
    end
  end
end
```
