## 🚀 Real-Time Updates with ActionCable
Use ActionCable to push live data into your Chartkick charts so users see real‑time updates without a full page reload. Set up a channel to stream chart data and call `Chartkick.charts["your-chart-id"].updateData` on every broadcast.

```ruby
# app/channels/chart_data_channel.rb
def subscribed
  stream_for "chart_data"
end
```

```javascript
// app/javascript/channels/chart_data_channel.js
import { createConsumer } from "@rails/actioncable"
import Chartkick from "chartkick"
import "chartkick/chart.js"

const consumer = createConsumer()
consumer.subscriptions.create("ChartDataChannel", {
  received(data) {
    // Update the chart with new data
    Chartkick.charts["realtime-chart"].updateData(data)
  }
})
```

```erb
<!-- app/views/dashboard/index.html.erb -->
<%= line_chart [], id: "realtime-chart", height: "300px" %>
```

```ruby
# Anywhere in Rails (e.g., controller or background job)
ChartDataChannel.broadcast_to("chart_data", [{name: "Sales", data: {"2023-01-01" => 100, "2023-01-02" => 150}}])
```