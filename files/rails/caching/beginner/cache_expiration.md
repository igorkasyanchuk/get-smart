## ⏰ Set Cache Expiration

Always set an expiration time (`expires_in`) to prevent stale data from persisting indefinitely. You can define this both in view helpers and in low-level fetch calls.

```erb
<%# app/views/dashboard/_stats.html.erb %>
<% cache("dashboard_stats", expires_in: 5.minutes) do %>
  <%= render partial: "stats_data", locals: { stats: Dashboard.generate_stats } %>
<% end %>
```