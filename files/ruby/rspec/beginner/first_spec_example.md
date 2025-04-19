## 📝 Write Your First Spec Example
Create a file under `spec/` ending with `_spec.rb` and use `describe` and `it` blocks to structure your tests. This convention makes it easy for RSpec to find and run your specs.

```ruby
# spec/calculator_spec.rb
require 'rspec'
require_relative '../calculator'

describe Calculator do
  it 'adds two numbers correctly' do
    calculator = Calculator.new
    expect(calculator.add(2, 3)).to eq(5)
  end
end
```