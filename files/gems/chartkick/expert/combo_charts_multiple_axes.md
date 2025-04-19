## 📊 Combining Multiple Series & Axes in One Chart
Expert dashboards often require mixing chart types (e.g., bars + lines) and dual axes. Chartkick’s `combo_chart` plus `library` lets you define per-series types and configure multiple y‑axes.

```erb
<%= combo_chart [
  { name: 'Revenue', data: revenue_by_month },
  { name: 'Growth Rate', data: growth_by_month, type: 'line', yAxisID: 'y2' }
],
library: {
  scales: {
    y: { position: 'left', title: { display: true, text: 'Revenue ($)' } },
    y2: { position: 'right', title: { display: true, text: 'Growth %' }, grid: { drawOnChartArea: false } }
  }
} %>
```

This pattern enables you to juxtapose absolute values and relative metrics seamlessly, giving stakeholders richer insights.