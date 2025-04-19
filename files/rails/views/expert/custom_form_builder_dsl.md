## 🛠️ Build a Custom Form Builder DSL
Craft a custom `ActionView::Helpers::FormBuilder` subclass to DRY up repetitive form markup and enforce consistent UI patterns.

```ruby
# app/form_builders/admin_form_builder.rb
class AdminFormBuilder < ActionView::Helpers::FormBuilder
  def input_group(attribute, &block)
    @template.content_tag(:div, class: 'input-group') do
      block.call
    end
  end
end
```

Activate in your view:

```erb
<%= form_with model: @user, builder: AdminFormBuilder do |f| %>
  <%= f.input_group :email do %>
    <%= f.label :email %>
    <%= f.email_field :email, class: 'form-control' %>
  <% end %>
<% end %>
```