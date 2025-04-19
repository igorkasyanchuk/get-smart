## 📊 Parameterized Testing with rspec-parameterized

Use the `rspec-parameterized` gem to run the same example with multiple input/output pairs, reducing duplication and making edge cases explicit. This approach keeps your specs concise and easy to extend with new scenarios.

```ruby
# Gemfile
gem 'rspec-parameterized'

# spec/models/math_spec.rb
require 'rspec-parameterized'

describe MathUtils do
  where(:a, :b, :sum) do
    [1, 2, 3]
    [5, 7, 12]
    [-1, -1, -2]
  end

  with_them do
    it 'adds two numbers correctly' do
      expect(MathUtils.add(a, b)).to eq(sum)
    end
  end
end
```