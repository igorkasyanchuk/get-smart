## 🚀 Integrate Lograge with Logstash

Combine `lograge` with the `logstash-logger` gem to ship logs directly to your Logstash instance over TCP or UDP. This reduces overhead and ensures your logs are available in real-time for search and visualization.

```ruby
# Gemfile
gem 'lograge'
gem 'logstash-logger'

# config/environments/production.rb
Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  config.logger = LogStashLogger.new(
    type: :tcp,
    host: 'logstash.example.com',
    port: 5000,
    sync: true
  )
end
```