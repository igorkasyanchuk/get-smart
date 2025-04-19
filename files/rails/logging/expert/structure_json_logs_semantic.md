## 📦 Structure JSON Logs with Semantic Fields
Switch to a structured logger (e.g., `logstash-logger` or `semantic_logger`) to emit JSON with consistent keys like `@timestamp`, `level`, `service`, and custom fields. This enables downstream systems (Elasticsearch, Datadog) to parse and filter logs efficiently.

```ruby
# Gemfile
gem 'logstash-logger'

# config/environments/production.rb
config.logger = LogStashLogger.new(
  type: :udp,
  host: 'logstash.local',
  port: 5228,
  formatter: LogStashLogger::Formatter::Json.new
)

# add custom metadata
active_support: { service: 'payments', environment: Rails.env }
```

```ruby
# anywhere in app code
def process_payment
  Rails.logger.info('charge.initiated', amount: 129.99, currency: 'USD')
end
# => {"@timestamp":"2023-06-01T12:00:00Z","level":"INFO","message":"charge.initiated","amount":129.99,"currency":"USD","service":"payments"}
```