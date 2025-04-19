## 🎯 Simulating Complex Block Yields with `and_yield`

For methods that yield multiple times or yield multiple arguments, chain `and_yield` calls to precisely emulate the real flow. This is ideal when testing orchestrators or event streams.

```ruby
def orchestrator
  yield :start, 1
  yield :middle, 2
  yield :end, 3
end

RSpec.describe 'orchestrator' do
  it 'processes steps in order' do
    spy = double('listener')
    allow(self)
      .to receive(:orchestrator)
      .and_yield(:start, 1)
      .and_yield(:middle, 2)
      .and_yield(:end, 3)

    orchestrator do |step, num|
      spy.step(step, num)
    end

    expect(spy).to have_received(:step).with(:start, 1).ordered
    expect(spy).to have_received(:step).with(:middle, 2).ordered
    expect(spy).to have_received(:step).with(:end, 3).ordered
  end
end
```
