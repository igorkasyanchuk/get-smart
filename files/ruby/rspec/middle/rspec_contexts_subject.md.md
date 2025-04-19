## 📂 Organizing Tests with `context` and `subject`

Use `context` blocks to group scenarios by state or input, and declare a `subject` for the primary object under test. This makes examples more declarative and eliminates repetition. Override `subject` or let-bound attributes in nested contexts to customize behavior without duplicating setup.

```ruby
describe OrderProcessor do
  subject(:processor) { described_class.new(order) }
  let(:order) { build(:order) }

  context "when order is valid" do
    it "processes successfully" do
      expect(processor.process).to be_truthy
    end
  end

  context "when payment fails" do
    before { allow(order).to receive(:pay!).and_raise(PaymentError) }

    it "raises an error" do
      expect { processor.process }.to raise_error(PaymentError)
    end
  end
end
```