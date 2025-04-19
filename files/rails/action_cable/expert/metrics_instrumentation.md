## 📊 Instrument and Monitor Action Cable with Prometheus Metrics

Expose Action Cable internals—connections, subscriptions, message throughput—for real‑time monitoring with Prometheus. Hook into connection lifecycle and received frames to feed counters and histograms.

```ruby
# config/initializers/action_cable_metrics.rb
require 'prometheus/client'

PROM = Prometheus::Client.registry
connection_counter = PROM.counter(:ac_connections_total, docstring: 'Total AC connections')
message_histogram = PROM.histogram(:ac_message_duration_seconds, docstring: 'Action Cable message processing time')

module ActionCable
  class Connection < Connection::Base
    def connect
      connection_counter.increment
      super
    end
  end

  class Channel < Channel::Base
    around_action :track_message

    private

    def track_message
      message_histogram.observe do
        yield
      end
    end
  end
end
```

Then mount a Prometheus endpoint:

```ruby
# config/routes.rb
get '/metrics', to: proc { [200, {}, [Prometheus::Client.registry.metrics_text]] }
```