## 🖌️ After‑Render Hook for Custom Annotations
Inject custom annotations or overlays by using Highcharts events under `library.chart.events.load`. You can draw shapes, text, or images after the chart is rendered.

```erb
<%= line_chart monthly_sales,
  library: {
    chart: {
      events: {
        load: -> {
          const chart = this
          chart.renderer.text("⚠️ Peak Month", chart.series[0].points[5].plotX + 50, chart.series[0].points[5].plotY + 20)
            .css({ color: "#FF0000", fontSize: "14px" })
            .add()
        }
      }
    }
  }
%>
```

```javascript
// Alternatively in pure JS for a Chart.js implementation:
import Chartkick from "chartkick"
import "chartkick/chart.js"

new Chartkick.LineChart("annotated-chart", monthlySales, {
  library: {
    animation: false,
    plugins: {
      annotation: {
        annotations: [{
          type: 'label',
          xValue: '2023-06-01',
          yValue: 120,
          backgroundColor: 'rgba(255,0,0,0.5)',
          content: ['🏆 Peak']
        }]
      }
    }
  }
})
```