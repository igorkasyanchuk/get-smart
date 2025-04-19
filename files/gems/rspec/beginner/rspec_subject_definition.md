## 🏷 Defining subject for Implicit Subjects

`subject` defines the primary object under test. When omitted, RSpec uses an implicit subject based on the describe target, but explicit `subject` improves clarity.

```ruby
RSpec.describe GreetingFormatter do
  subject { described_class.new('Hello') }

  it 'formats with a greeting' do
    expect(subject.format).to eq('Hello, world!')
  end
end
```
