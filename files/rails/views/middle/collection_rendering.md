## 🔄 Collection Rendering
When rendering a list of records, use the `collection` option to avoid an explicit loop in your template. Rails will render the partial once for each item and automatically set a local with the singular name.

```erb
<%= render partial: "comment", collection: @post.comments, as: :comment %>
```

This is equivalent to:

```erb
<% @post.comments.each do |comment| %>
  <%= render "comment", comment: comment %>
<% end %>
```