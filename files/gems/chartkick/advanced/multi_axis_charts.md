## ⚖️ Multi‑Axis and Combined Charts
Chartkick supports multiple data series on separate axes by passing in `yAxis` indexes and `library.yAxis` configuration—ideal for comparing metrics with different scales.

```erb
<%= column_chart [
  {name: "Temperature", data: temps, yAxis: 0},
  {name: "Humidity", data: hums, yAxis: 1}
],
library: {
  yAxis: [
    { title: { text: "Temperature (°C)" }, opposite: false },
    { title: { text: "Humidity (%)" }, opposite: true }
  ],
  title: { text: "Environment Metrics" }
}
%>
```

```javascript
// Using Highcharts directly via Chartkick for maximum control
new Chartkick.ColumnChart("env-chart", [
  {name: "Temperature", data: temps, yAxis: 0},
  {name: "Humidity", data: hums, yAxis: 1}
], {
  library: {
    yAxis: [{ title: { text: "Temp (°C)" }}, { title: { text: "Humidity (%)" }, opposite: true }]
  }
})
```