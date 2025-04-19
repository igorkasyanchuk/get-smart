## 🛠️ Using `content_tag` for Custom HTML Elements

The `content_tag` helper lets you build HTML tags programmatically with attributes and content. It's perfect for generating complex markup while keeping your view clean.

```erb
<%= content_tag :div, class: "alert alert-success", data: { dismiss: 'alert' } do %>
  <strong>Success!</strong> Your record has been saved.
<% end %>
```

In Ruby helper methods you can also return safe HTML:

```ruby
def custom_panel(title, &block)
  content_tag :section, class: 'panel' do
    concat content_tag(:h2, title)
    concat capture(&block)
  end
end
```
