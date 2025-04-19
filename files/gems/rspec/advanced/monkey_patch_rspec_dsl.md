## 🐒 Safely Monkey-Patch RSpec DSL for Custom Syntax

You can extend RSpec’s DSL by redefining core methods or adding new ones, but ensure you isolate your changes to avoid conflicts. Wrap patches in modules and include them selectively via metadata, maintaining clarity and preventing global side effects.

```ruby
# spec/support/monkey_patches/focus_helpers.rb
module FocusHelpers
  def focused_it(description, &block)
    it description, :focus do
      instance_exec(&block)
    end
  end
end

RSpec.configure do |config|
  config.extend FocusHelpers, focused: true
end

# Usage in spec
RSpec.describe 'Feature X', :focused do
  focused_it 'only runs this example' do
    expect(1 + 1).to eq(2)
  end
end
```