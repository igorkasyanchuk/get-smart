## 🧪 Deep Testing with Custom ViewComponent Matchers
Elevate your component tests by writing custom RSpec matchers and leveraging `ViewComponent::TestHelpers` to introspect private methods or slots. Use `render_inline` with dynamic locals and assert deep structure via `have_css` and `text` matchers.

```ruby
# spec/components/nav_menu_component_spec.rb
require "rails_helper"

RSpec.describe NavMenuComponent, type: :component do
  include ViewComponent::TestHelpers

  subject(:rendered) { render_inline(described_class.new(active: :dashboard)) }

  it "highlights the active menu item" do
    expect(rendered).to have_css(".nav-item.active", text: "Dashboard")
  end

  it "renders all slots in correct order" do
    rendered = render_inline(described_class.new) do |c|
      c.slot :item, name: :home, url: "/"
      c.slot :item, name: :profile, url: "/profile"
    end

    expect(rendered.css(".nav-item").first.text).to eq("Home")
  end
end
```