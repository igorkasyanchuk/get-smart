## 🚀 Custom Flipper Instrumentation for Real-time Metrics

You can swap Flipper's default instrumenter to push gate evaluation events to external systems like StatsD, enabling real-time monitoring and alerting. By injecting a custom lambda or Proc into `config.instrumenter`, you capture each gate evaluation along with metadata and duration, sending metrics with tags for deeper analytics. This approach scales in distributed environments and integrates with existing observability stacks.

```ruby
# config/initializers/flipper.rb
require 'statsd'

statsd = Statsd.new('statsd.myhost', 8125)

Flipper.configure do |config|
  config.adapter { Flipper::Adapters::Redis.new(Redis.new) }

  config.instrumenter = lambda do |event_name, duration, payload|
    feature = payload[:feature_name]
    result  = payload[:result]
    statsd.increment('flipper.gate.%s' % event_name, tags: ['feature:%s' % feature, 'result:%s' % result])
    statsd.timing('flipper.gate.%s.duration' % event_name, duration, tags: ['feature:%s' % feature])
  end
end
```
