## 📈 Enhance Lograge with Custom Payloads and Append Ergonomics
Leverage Lograge to collapse Rails’ multi-line logs into single JSON lines and enrich them with custom payloads (e.g., current_user.id, DB runtime). Define `custom_options` and register appenders for external sinks.

```ruby
# config/initializers/lograge.rb
Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.custom_options = lambda do |event|
    {
      user_id: event.payload[:user_id],
      db_runtime: event.payload[:db_runtime],
      cache_hits: event.payload[:cache_hits]
    }
  end

  config.lograge.logger = ActiveSupport::Logger.new('log/production_json.log')
end
```

```ruby
# in ApplicationController
before_action do
  request.payload[:user_id] = current_user&.id
end
```