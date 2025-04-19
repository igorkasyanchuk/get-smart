## 📝 Build Forms with `form_with`

`form_with` is the modern helper for generating forms. It supports model binding, remote submissions, and customizable HTML options.

```erb
<%= form_with(model: @post, local: true) do |f| %>
  <div class="field">
    <%= f.label :title %>
    <%= f.text_field :title %>
  </div>

  <div class="field">
    <%= f.label :body %>
    <%= f.text_area :body %>
  </div>

  <%= f.submit 'Publish' %>
<% end %>
```