## ✨ Custom Form Builder for Shared Helpers

Create a custom form builder to encapsulate shared input patterns and error handling. Inherit from `ActionView::Helpers::FormBuilder` and override methods or add your own helpers for consistent markup across forms.

```ruby
# app/helpers/application_form_builder.rb
class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  def labeled_input(attribute, **options)
    @template.content_tag(:div, class: 'form-group') do
      label(attribute, class: 'form-label') +
      text_field(attribute, merge_class(options, 'form-control')) +
      error_message(attribute)
    end
  end

  private

  def error_message(attribute)
    return ''.html_safe unless object.errors[attribute].any?

    @template.content_tag(:div, object.errors[attribute].join(', '), class: 'invalid-feedback')
  end

  def merge_class(options, klass)
    options[:class] = [options[:class], klass].compact.join(' ')
    options
  end
end
```

Then configure `ApplicationController` to use your builder by default:

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action { ActionView::Base.default_form_builder = ApplicationFormBuilder }
end
```