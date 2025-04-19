## 🎁 Stub methods that yield to blocks with `and_yield`

For methods that accept blocks (like iterators or callbacks), use `and_yield` to simulate yielding values. You can chain multiple `and_yield` calls to mock each iteration or callback invocation.

```ruby
RSpec.describe StreamProcessor do
  it 'processes each line' do
    stream = double('Stream')
    allow(stream).to receive(:each).and_yield('line1').and_yield('line2')

    lines = []
    stream.each { |line| lines << line.upcase }

    expect(lines).to eq(['LINE1', 'LINE2'])
  end
end
```
