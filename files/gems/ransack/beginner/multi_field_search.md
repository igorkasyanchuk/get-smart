## 📋 Searching Across Multiple Fields
Use multiple predicates in a single form to search on several columns. Ransack joins conditions with AND by default but you can also group with OR.

```erb
<%= search_form_for @q, url: users_path, method: :get do |f| %>
  <%= f.label :first_name_or_last_name_cont, "Name contains" %>
  <%= f.search_field :first_name_or_last_name_cont %>

  <%= f.label :email_cont, "Email contains" %>
  <%= f.search_field :email_cont %>

  <%= f.submit "Filter Users" %>
<% end %>
```

In your controller:

```ruby
@q = User.ransack(params[:q])
@users = @q.result(distinct: true)
```