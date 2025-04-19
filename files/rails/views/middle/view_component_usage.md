## ⚙️ Leveraging ViewComponent for Reusable UI
ViewComponent helps you build encapsulated, testable view components. Create a component class and its template to isolate complex UI logic.

```ruby
# app/components/button_component.rb
class ButtonComponent < ViewComponent::Base
  def initialize(text:, type: :primary)
    @text = text
    @type = type
  end
end
```

```erb
<!-- app/components/button_component.html.erb -->
<button class="btn btn-<%= @type %>"><%= @text %></button>
```