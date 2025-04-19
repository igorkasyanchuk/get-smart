## 📅 Use `group_by_day`/`week`/`month` for time-series charts

Chartkick integrates seamlessly with ActiveSupport’s time grouping methods. By using `group_by_day`, `group_by_week` or `group_by_month` on your ActiveRecord queries, you can generate time-series data automatically. This is ideal for visualizing trends over time without manual aggregation.

```ruby
# Controller
@signups = User.group_by_day(:created_at, last: 30).count

# View (ERB)
<%= line_chart @signups,
  xtitle: "Date",
  ytitle: "New Signups",
  library: {colors: ["#3498db"]}
%>
```