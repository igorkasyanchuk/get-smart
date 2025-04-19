## ☑️ Manage multi-select checkboxes for arrays
To create a set of checkboxes that submit an array, use `check_box_tag` with `name` ending in `[]`. In your controller, Rails will provide an array of selected values.

```erb
<%= form_with(url: tags_path) do |form| %>
  <% Tag.all.each do |tag| %>
    <%= check_box_tag 'post[tag_ids][]', tag.id, @post.tag_ids.include?(tag.id) %>
    <%= label_tag "post_tag_ids_#{tag.id}", tag.name %><br>
  <% end %>
  <%= form.submit 'Save Tags' %>
<% end %>
```
