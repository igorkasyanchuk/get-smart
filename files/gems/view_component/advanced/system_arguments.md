## 🎨 Using `system_arguments` for Dynamic CSS and HTML Attributes
The `system_arguments` helper in ViewComponent allows you to merge default and user-provided HTML attributes (like classes or data-attributes) seamlessly. This pattern is powerful for building themeable, reusable components without manual `tag` calls.

```ruby
# app/components/button_component.rb
class ButtonComponent < ViewComponent::Base
  def initialize(**system_arguments)
    @system_arguments = system_arguments
    @system_arguments[:class] = class_names(
      "btn-base",
      system_arguments[:variant] == :primary ? "btn-primary" : "btn-secondary",
      system_arguments[:class]
    )
  end

  def call
    tag.button(**@system_arguments) { content }
  end
end
```

```erb
<%= render(ButtonComponent.new(variant: :primary, data: { action: "click->modal#open" })) do %>
  Open Modal
<% end %>
```