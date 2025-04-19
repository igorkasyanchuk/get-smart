## 🧪 Advanced Component Testing with RSpec & Capybara Matchers
Use `render_inline` from `ViewComponent::TestHelpers` alongside Capybara matchers to write expressive tests. This allows you to assert on complex HTML structures, ARIA attributes, and CSS classes reliably.

```ruby
# spec/components/alert_component_spec.rb
require "rails_helper"

RSpec.describe AlertComponent, type: :component do
  include ViewComponent::TestHelpers

  it "renders success alert with message" do
    result = render_inline(AlertComponent.new(type: :success)) { "All good!" }

    expect(result).to have_css(".alert-success", text: "All good!")
    expect(result.css(".alert").first["role"]).to eq("alert")
  end
end
```