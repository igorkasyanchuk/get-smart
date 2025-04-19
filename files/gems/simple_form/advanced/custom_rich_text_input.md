## ✨ Create a Custom Rich Text Input Component

Building a custom input class lets you encapsulate third‑party JavaScript editors like Trix or CKEditor. By subclassing `SimpleForm::Inputs::Base`, you can define default HTML attributes, include required JS libraries, and integrate file uploads or formatting toolbars with minimal repetitive code.

```ruby
# app/inputs/rich_text_input.rb
class RichTextInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options)
    merged_options = merge_wrapper_options(input_html_options, wrapper_options)
    @builder.text_area(attribute_name, merged_options.merge(class: 'rich-text-editor', data: { direct_upload: true }))
  end
end

# Usage in a form:
= simple_form_for(@article) do |f|
  = f.input :content, as: :rich_text
```