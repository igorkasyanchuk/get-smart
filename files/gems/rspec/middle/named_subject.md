## 🎯 Named `subject`

By default, `subject` is an anonymous instance, but naming it clarifies intent and allows multiple subjects in a single file. Use `subject(:name)` for better readability when you have more than one subject.

```ruby
RSpec.describe Calculator do
  subject(:calc) { Calculator.new }
  subject(:slow_calc) { Calculator.new(mode: :slow) }

  describe "fast mode" do
    it "adds numbers quickly" do
      expect(calc.add(1,2)).to eq(3)
    end
  end

  describe "slow mode" do
    it "adds numbers with delay" do
      expect(slow_calc.add(1,2)).to eq(3)
    end
  end
end
```
