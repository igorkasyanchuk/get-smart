## 📦 Structured JSON Logging

Emit logs in structured JSON to integrate seamlessly with ELK stack or Datadog. Use `lograge` gem and a custom JSON formatter to produce one-event-per-request logs that are easily queryable and filterable downstream.

```ruby
# Gemfile
gem 'lograge'

# config/environments/production.rb
Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.custom_options = lambda do |event|
    {
      time: event.time.utc.iso8601,
      params: event.payload[:params].except('controller','action','format','utf8'),
      user_id: event.payload[:user_id]
    }
  end
end
```