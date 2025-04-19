## 📝 Creating a form with `form_tag`
Use `form_tag` to build forms not directly tied to a model, such as search forms or filters. It lets you specify the URL and HTTP method manually. Handle the parameters in the controller accordingly.

```ruby
<%= form_tag search_posts_path, method: :get do %>
  <%= label_tag :query, "Search Posts" %>
  <%= text_field_tag :query, params[:query] %>
  <%= submit_tag "Search" %>
<% end %>
```
