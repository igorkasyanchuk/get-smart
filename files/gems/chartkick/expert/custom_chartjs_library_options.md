## 🎨 Advanced Animations & Styling with Chart.js Options
Chartkick’s `library` prop lets you pass any Chart.js configuration. Unlock granular control over animations, plugins, and scales to craft polished, custom visuals.

```erb
<%= column_chart sales_data,
  library: {
    animation: {
      duration: 2000,
      easing: 'easeInOutQuart'
    },
    plugins: {
      legend: { position: 'top' }
    },
    scales: {
      y: { beginAtZero: true, ticks: { callback: ->(v) { "$#{v}" } } }
    }
  }
%>
```

For global defaults, extend Chart.js before your page loads:

```javascript
// app/javascript/packs/application.js
import Chart from 'chart.js/auto'
Chart.defaults.font.family = 'Roboto'
Chart.defaults.animation.duration = 1000
```