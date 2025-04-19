## 🧩 Using Partials to DRY Views

Partials help you reuse view code across actions or controllers. Prefix filenames with an underscore and render them where needed. You can pass locals to customize the partial’s behavior.

```erb
<!-- app/views/articles/_form.html.erb -->
<%= form_with model: @article do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :body %>
  <%= f.submit %>
<% end %>

<!-- app/views/articles/new.html.erb -->
<%= render 'form', article: @article %>
```