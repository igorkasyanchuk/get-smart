## 🧪 Testing Components with RSpec and Capybara

Writing component tests ensures UI consistency. Use `render_inline` to mount your component and Capybara matchers to assert the output.

```ruby
# spec/components/button_component_spec.rb
require "rails_helper"

RSpec.describe ButtonComponent, type: :component do
  it "renders primary button with label" do
    render_inline(ButtonComponent.new(label: "Click me", style: :primary))

    expect(page).to have_css("button.btn-primary", text: "Click me")
  end
end
```