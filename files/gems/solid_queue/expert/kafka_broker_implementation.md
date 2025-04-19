## 🛠️ Custom Kafka Broker Implementation

Extend SolidQueue to publish and consume messages via Kafka for ultra-low latency and at-least-once delivery semantics. Implement the `Broker` interface and leverage the `ruby-kafka` gem.

```ruby
# app/brokers/kafka_broker.rb
require 'kafka'

class KafkaBroker < SolidQueue::Broker
  def initialize(config)
    @kafka = Kafka.new(seed_brokers: config[:brokers])
    @topic = config[:topic]
  end

  def push(message)
    @kafka.deliver_message(message.to_json, topic: @topic)
  end

  def pop(batch_size: 10, timeout: 5)
    @kafka.each_message(topic: @topic, max_wait_time: timeout, max_bytes_per_partition: batch_size) do |msg|
      yield JSON.parse(msg.value)
    end
  end
end

# config/initializers/solid_queue.rb
SolidQueue.configure do |c|
  c.broker = KafkaBroker.new(
    brokers: ['kafka1:9092','kafka2:9092'],
    topic: 'solid_queue_topic'
  )
end
```