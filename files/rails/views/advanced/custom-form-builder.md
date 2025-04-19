## 📝 Tip: Create a Custom Form Builder for Consistent Markup
Subclass `ActionView::Helpers::FormBuilder` to wrap common patterns (e.g., error display, wrappers) and register it via `form_with`. This enforces a uniform input structure.

Example:

```ruby
# app/forms/bootstrap_form_builder.rb
class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options = {})
    @template.content_tag(:div, class: 'form-group') do
      super + error_message(method)
    end
  end

  private

  def error_message(method)
    return '' unless object.errors[method].any?
    @template.content_tag(:span, object.errors[method].join(', '), class: 'text-danger')
  end
end
``` 
```erb
<%= form_with(model: @user, builder: BootstrapFormBuilder) do |f| %>
  <%= f.text_field :email %>
  <%= f.submit %>
<% end %>
```