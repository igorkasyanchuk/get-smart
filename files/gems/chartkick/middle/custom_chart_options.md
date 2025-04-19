## 🎨 Customize chart appearance with `library` options

Beyond the built-in Chartkick options, you can tap into the underlying charting library’s configuration via the `library` key. Use it to tweak colors, axes, tooltips, legends, and more for a tailored look and feel.

```erb
<%= column_chart Order.group_by_month(:completed_at).count,
  xtitle: "Month",
  ytitle: "Orders",
  library: {
    title: {text: "Monthly Orders", fontSize: 18},
    legend: {position: "bottom"},
    colors: ["#2ecc71"],
    tooltip: {shared: true, useHTML: true}
  }
%>
```