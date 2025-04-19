## 🔧 Testing a ViewComponent with RSpec

ViewComponent ships with helpers to make component testing easy. Use `render_inline` to render your component in tests, then assert on the generated HTML. This ensures your UI logic stays correct as your application evolves.

```ruby
# spec/components/hello_world_component_spec.rb
require 'rails_helper'

RSpec.describe HelloWorldComponent, type: :component do
  it 'renders the greeting text' do
    result = render_inline(HelloWorldComponent.new(greeting: 'Hi there'))
    expect(result.css('p').text).to eq('Hi there')
  end
end
```