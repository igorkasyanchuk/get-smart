## 📊 Combine multiple data series in one chart

Chartkick allows you to plot several series side by side by passing an array of hashes. Each hash can include a `name` and its own data. This makes it easy to compare metrics like sales vs. signups or different user segments.

```ruby
# Controller
@daily_sales = Order.group_by_day(:completed_at).sum(:total_price)
@daily_signups = User.group_by_day(:created_at).count

# View (ERB)
<%= line_chart [
  {name: "Sales", data: @daily_sales},
  {name: "Signups", data: @daily_signups}
],
  stacked: false,
  library: {pointSize: 5}
%>
```