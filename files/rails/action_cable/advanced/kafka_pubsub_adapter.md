## 🛠️ Custom Kafka Pub/Sub Adapter
Swap out Redis in favor of Kafka for larger-scale, durable messaging. Implement a minimal adapter conforming to Action Cable’s API and configure it in `cable.yml`.

```ruby
# lib/action_cable/subscription_adapter/kafka.rb
module ActionCable
  module SubscriptionAdapter
    class Kafka
      def broadcast(channel, payload)
        producer.produce(topic: channel, payload: payload.to_json)
        producer.deliver_messages
      end

      def subscribe(channel, callback)
        consumer.subscribe([channel])
        Thread.new do
          consumer.each_message(automatically_mark_as_processed: true) do |msg|
            callback.call(JSON.parse(msg.value))
          end
        end
      end

      private
      def producer
        @producer ||= Kafka.new(seed_brokers: ['kafka://localhost:9092']).producer
      end

      def consumer
        @consumer ||= Kafka.new(seed_brokers: ['kafka://localhost:9092']).consumer(group_id: 'action_cable')
      end
    end
  end
end
```

```yaml
# config/cable.yml
development:
  adapter: kafka
  url: kafka://localhost:9092
```