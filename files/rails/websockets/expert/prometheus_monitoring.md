## 🛠️ Instrumenting WebSocket Metrics with Prometheus
Integrate Prometheus to monitor ActionCable connections, message rates, and latencies. Expose metrics via a Rack endpoint and use custom subscribers to record channel events.

```ruby
# config/initializers/prometheus_cable.rb
require 'prometheus/client'

PROM = Prometheus::Client.registry
connections_gauge = PROM.gauge(:action_cable_connections, 'Active ActionCable connections')
messages_counter = PROM.counter(:action_cable_messages, 'Total messages processed', labels: [:channel])

ActiveSupport::Notifications.subscribe('action_cable.subscribe') { |_| connections_gauge.increment }
ActiveSupport::Notifications.subscribe('action_cable.unsubscribe') { |_| connections_gauge.decrement }
ActiveSupport::Notifications.subscribe('action_cable.broadcast') do |_, _, _, _, payload|
  messages_counter.increment(labels: { channel: payload[:channel] })
end
```

```ruby
# config/routes.rb
mount Prometheus::Client::Rack::Exporter, at: '/metrics'
```

Now Prometheus can scrape `/metrics` to track real-time WebSocket usage and diagnose performance bottlenecks.