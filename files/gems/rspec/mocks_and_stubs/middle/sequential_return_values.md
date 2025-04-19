## ⏭️ Return different values for consecutive calls

When your code calls the same method multiple times and you need varied responses, pass multiple arguments to `and_return`. This is ideal for simulating stateful services or counters.

```ruby
RSpec.describe CounterUser do
  it 'uses incremental values' do
    counter = double('Counter')
    allow(counter).to receive(:next).and_return(1, 2, 3)

    expect(counter.next).to eq(1)
    expect(counter.next).to eq(2)
    expect(counter.next).to eq(3)
  end
end
```
