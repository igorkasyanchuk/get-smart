## ✍️ Adding text fields and labels
Labels help users understand what input is expected, and pairing them with form helpers improves accessibility. Use `form.label` alongside `form.text_field` or their tag-based counterparts. This structure also auto-links the label to the input.

```ruby
<%= form_with model: @article, local: true do |f| %>
  <%= f.label :title, "Article Title" %>
  <%= f.text_field :title, placeholder: "Enter a title" %>
<% end %>
```
