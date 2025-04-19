## 🎨 Customize Chart Appearance with Options

You can tweak colors, legends, tooltips, and more via options passed to your chart helper. Use the `library` key to hop into the underlying charting library’s full API.

```erb
<%= line_chart @users_by_day,
  colors: ["#ff6384", "#36a2eb"],
  points: false,
  xtitle: "Date",
  ytitle: "Count",
  library: {
    title: { display: true, text: "User Sign‑ups Over Time" },
    scales: { yAxes: [{ ticks: { beginAtZero: true } }] }
  }
%>
```