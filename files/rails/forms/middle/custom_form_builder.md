## ✨ Create a custom `FormBuilder`
Subclass `ActionView::Helpers::FormBuilder` to encapsulate repetitive patterns or styling. Then pass it to your form helpers via the `builder` option.

```ruby
# lib/custom_form_builder.rb
class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def labeled_field(method, label_text = nil, **options)
    label(method, label_text) + text_field(method, options.merge(class: 'custom-field'))
  end
end
```

```erb
<%= form_with(model: @product, builder: CustomFormBuilder) do |form| %>
  <%= form.labeled_field :name, 'Product Name' %>
  <%= form.submit %>
<% end %>
```
