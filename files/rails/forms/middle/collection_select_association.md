## 🔗 Use `collection_select` for associations
When working with Active Record associations, `collection_select` helps bind your select fields directly to model attributes. It automatically sets the selected option based on the record’s current value.

```erb
<%= form_with(model: @post) do |form| %>
  <%= form.collection_select :category_id, Category.all, :id, :name, prompt: 'Choose Category' %>
  <%= form.submit %>
<% end %>
```
