## 🤖 Tracking Instantiation with `class_spy` and `and_call_original`

Combine `class_spy` with `and_call_original` to monitor `.new` calls while preserving the original constructor behavior. This is crucial when verifying that factories or service objects are built with the correct arguments without altering their logic.

```ruby
class WidgetFactory
  def initialize(size)
    @size = size
  end

  def build
    # build logic returning a widget
    "widget(#{@size})"
  end
end

RSpec.describe WidgetFactory do
  it 'spies on .new and still calls the real constructor' do
    factory_spy = class_spy('WidgetFactory').as_stubbed_const
    allow(WidgetFactory).to receive(:new).and_call_original

    instance = WidgetFactory.new(5)
    result = instance.build

    expect(factory_spy).to have_received(:new).with(5)
    expect(result).to eq('widget(5)')
  end
end
```
