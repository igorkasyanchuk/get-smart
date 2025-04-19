## 🔗 Searching Through Associations with Ransack

Ransack makes it easy to search across associated models by leveraging nested predicates. You can target fields on related records by joining association names and attribute names with underscores. This lets you build forms that filter parent records by attributes stored in associated tables.

```erb
<%= search_form_for @q do |f| %>
  <div>
    <%= f.label :profile_age_eq, "Age" %>
    <%= f.number_field :profile_age_eq %>
  </div>
  <div>
    <%= f.label :profile_city_cont, "City contains" %>
    <%= f.text_field :profile_city_cont %>
  </div>
  <%= f.submit "Search" %>
<% end %>
```

```ruby
# In controller
@q = User.ransack(params[:q])
@users = @q.result.includes(:profile)
```

By including the `:profile` association, you avoid N+1 queries when filtering by `profile_age_eq` or `profile_city_cont`.
