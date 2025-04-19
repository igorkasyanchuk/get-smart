## 🛠️ Custom Form Builder for Unified Input DSL
Create a centralized form builder to enforce consistent markup, error handling, and custom inputs across your app. By subclassing `ActionView::Helpers::FormBuilder`, you can define helper methods (e.g., `f.input_field`) that wrap labels, inputs, and error messages automatically.

```ruby
# app/helpers/unified_form_builder.rb
class UnifiedFormBuilder < ActionView::Helpers::FormBuilder
  def input_field(attribute, **options)
    label_html = label(attribute, class: 'form-label')
    input_html = super(attribute, class: 'form-control', **options)
    errors = @object.errors[attribute].map { |e| @template.content_tag(:div, e, class: 'invalid-feedback') }.join.html_safe
    @template.content_tag(:div, class: "mb-3 #{'has-error' if errors.present?}") do
      label_html + input_html + errors
    end
  end
end

# In ApplicationHelper
def unified_form_with(**options, &block)
  options[:builder] = UnifiedFormBuilder
  form_with(**options, &block)
end
```

Use `unified_form_with model: @user` in your views to get consistent styling and error display.