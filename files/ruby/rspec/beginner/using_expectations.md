## 🔍 Use `expect` Syntax for Assertions
RSpec’s `expect` syntax is readable and intuitive. Wrap your target call in `expect(...)` and chain matcher methods like `to eq` or `to be_truthy` to assert behavior.

```ruby
# spec/string_spec.rb
describe String do
  it 'returns uppercase version' do
    expect('hello'.upcase).to eq('HELLO')
  end

  it 'is empty when initialized without arguments' do
    expect(String.new.empty?).to be_truthy
  end
end
```