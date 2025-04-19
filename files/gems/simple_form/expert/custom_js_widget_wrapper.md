## 🛠️ Creating Custom Input Wrappers for JS Widgets

When you need to integrate a complex JavaScript-based widget (e.g., a date‑range picker) into your Rails forms, build a custom SimpleForm input and wrapper. This approach lets you encapsulate all markup, classes, and data attributes in one reusable component.

1. Create the custom input class under `app/inputs/date_range_input.rb`:

```ruby
# app/inputs/date_range_input.rb
class DateRangeInput < SimpleForm::Inputs::Base
  def input(wrapper_options = nil)
    merged = merge_wrapper_options(input_html_options, wrapper_options)
    @builder.text_field(attribute_name, merged.merge(data: { controller: 'daterange', action: 'focus->daterange#open' }))
  end
end
```

2. Configure a custom wrapper in `config/initializers/simple_form.rb`:

```ruby
SimpleForm.setup do |config|
  config.wrappers :js_widget, tag: 'div', class: 'field js-widget', error_class: 'has-error' do |b|
    b.use :label, class: 'widget-label'
    b.wrapper tag: 'div', class: 'widget-input-container' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'widget-error' }
    end
    b.use :hint,  wrap_with: { tag: 'p', class: 'widget-hint' }
  end
end
```

3. Use it in your form:

```erb
<%= simple_form_for @report do |f| %>
  <%= f.input :period, as: :date_range, wrapper: :js_widget, label: 'Report Period' %>
  <%= f.button :submit %>
<% end %>
```

Now your date‑range picker will render with the correct markup and Stimulus hooks, fully isolated in a custom wrapper.