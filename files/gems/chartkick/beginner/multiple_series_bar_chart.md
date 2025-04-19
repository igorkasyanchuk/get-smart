## 🎯 Build a Multi‑Series Bar Chart

Bar charts can compare multiple data series side by side. For example, track new users versus paid subscriptions per month by passing a hash of series to `bar_chart`.

```ruby
# app/controllers/dashboard_controller.rb
def stats
  @stats = {
    "New Users" => User.group_by_month(:created_at).count,
    "Subscriptions" => Subscription.group_by_month(:created_at).count
  }
end
```

```erb
<!-- app/views/dashboard/stats.html.erb -->
<%= bar_chart @stats, stacked: false, xtitle: "Month", ytitle: "Count" %>
```