## 🔗 Dynamic URLs with `link_to` and Route Helpers

Use `link_to` alongside Rails path helpers to generate links with dynamic parameters. You can also use block form to wrap complex content.

```erb
<%= link_to user_path(@user), class: 'user-link' do %>
  <%= image_tag @user.avatar_url, alt: @user.name, class: 'avatar' %>
  <span><%= @user.name %></span>
<% end %>
```

For polymorphic resources:

```erb
<%= link_to 'Show Resource', polymorphic_path([:admin, @resource]) %>
```
