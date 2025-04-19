## 📝 Writing it Blocks

Inside a `describe`, use `it` blocks to define individual examples that describe expected behavior. Each `it` should contain a single expectation for clarity.

```ruby
RSpec.describe Calculator do
  it 'adds two numbers correctly' do
    expect(Calculator.new.add(2, 3)).to eq(5)
  end
end
```
