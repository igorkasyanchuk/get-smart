## 🧰 Extending SimpleForm::FormBuilder with Custom Macros

For ultra‑DRY forms, extend `SimpleForm::FormBuilder` to add your own input methods (macros) that bundle common patterns. This is ideal if you repeatedly use the same combination of input, hints, icons, or error behaviors.

1. Create an initializer (e.g., `config/initializers/simple_form_macros.rb`):

```ruby
# config/initializers/simple_form_macros.rb
module SimpleForm
  class FormBuilder
    # Macro for an input with a prepended icon and auto-tooltip
    def icon_input(attribute, icon_name:, **options)
      merged = merge_wrapper_options(
        input_html_options, options[:wrapper_html] || {}
      )

      @template.content_tag(:div, class: 'input-group') do
        @template.content_tag(:div, class: 'input-group-prepend') do
          @template.content_tag(:span, '', class: "input-group-text fa fa-#{icon_name}")
        end +
        input(attribute, merged)
      end
    end
  end
end
```

2. Use it in your forms:

```erb
<%= simple_form_for @user do |f| %>
  <%= f.icon_input :email, icon_name: 'envelope', wrapper: :vertical_form %>
  <%= f.button :submit, class: 'btn btn-success' %>
<% end %>
```

3. Because it's a true FormBuilder method, you get full access to SimpleForm options (`label`, `hint`, `error`, `wrapper`) and can evolve the macro as your design system grows.