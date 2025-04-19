## 📊 Use Collection Inputs for Radios and Selects
When you need to present a list of options, Simple Form’s collection helpers simplify rendering `<select>`, radio buttons, or checkboxes. Pass an ActiveRecord collection or array directly, and customize item wrappers or labels for a cleaner markup.

```ruby
= simple_form_for @post do |f|
  # A grouped select
  = f.input :category_id,
            collection: Category.all.group_by(&:group_name),
            as: :grouped_select,
            group_label_method: :first,
            group_method: :last,
            label_method: :name,
            value_method: :id,
            prompt: 'Choose a category'

  # Radio buttons with custom item wrapper class
  = f.input :status,
            collection: [['Draft','draft'], ['Published','published']],
            as: :radio_buttons,
            item_wrapper_class: 'form-check form-check-inline'
```