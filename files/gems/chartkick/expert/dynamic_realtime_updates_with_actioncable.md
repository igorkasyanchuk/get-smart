## 🚀 Real-Time Charts with ActionCable
Leverage ActionCable to stream live updates to your Chartkick charts for truly reactive dashboards. By broadcasting deltas from your Rails backend and updating the chart client‑side, you avoid full page reloads and minimize payload sizes.

In your channel (e.g., `ChartsChannel`), broadcast new data points:

```ruby
# app/channels/charts_channel.rb
class ChartsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "charts_#{params[:chart_id]}"
  end
end

# in a background job or controller
ActionCable.server.broadcast(
  "charts_#{chart.id}",
  { x: Time.current.to_s(:db), y: new_value }
)
```

On the client, subscribe and push updates into your Chartkick chart instance:

```javascript
// app/javascript/channels/charts_channel.js
import consumer from "@rails/actioncable"
import Chartkick from "chartkick"

consumer.subscriptions.create(
  { channel: "ChartsChannel", chart_id: "sales-chart" },
  {
    received(data) {
      // chart is a global Chartkick chart instance
      window.salesChart.update([{name: "Sales", data: [[data.x, data.y]]}])
    }
  }
)

// in your view initializer:
window.salesChart = new Chartkick.LineChart("sales-chart", initialData)
```