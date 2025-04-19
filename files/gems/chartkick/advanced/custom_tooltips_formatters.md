## 🎨 Custom Tooltips and Formatters
Leverage Chartkick’s `library` option to pass through formatting callbacks (e.g., Chart.js or Highcharts) and display rich, contextual tooltips. This example uses Chart.js callbacks to prefix values and show percentages.

```erb
<%= line_chart sales_data,
  library: {
    tooltips: {
      callbacks: {
        label: ->(tooltipItem, data) {
          "Revenue: $#{tooltipItem.yLabel.toLocaleString}" + " (#{((tooltipItem.yLabel / data.datasets[0].data.reduce(&:+)) * 100).toFixed(1)}%)"
        }
      }
    }
  }
%>
```

```javascript
// If you need to write it in pure JS (e.g., in a pack):
import Chartkick from "chartkick"
import "chartkick/chart.js"

new Chartkick.LineChart("custom-tooltip", salesData, {
  library: {
    tooltips: {
      callbacks: {
        label: function(tooltipItem, data) {
          const total = data.datasets[tooltipItem.datasetIndex].data.reduce((a,b) => a+b)
          return `Revenue: $${tooltipItem.value} (${((tooltipItem.value/total)*100).toFixed(1)}%)`
        }
      }
    }
  }
})
```