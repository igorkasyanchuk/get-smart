## 🔍 Integrate OpenTelemetry Tracing in Sidekiq Middleware

To achieve end-to-end traceability, inject OpenTelemetry spans into Sidekiq job lifecycles. Implement both client and server middleware to propagate context and record latency.

```ruby
# Gemfile
gem 'opentelemetry-sdk'
gem 'opentelemetry-instrumentation-sidekiq'

# config/initializers/opentelemetry.rb
require 'opentelemetry/sdk'
require 'opentelemetry/instrumentation/sidekiq'

OpenTelemetry::SDK.configure do |c|
  c.use 'OpenTelemetry::Instrumentation::Sidekiq'
end

# Optionally customize middleware
Sidekiq.configure_server do |config|
  config.server_middleware.insert_before(0, OpenTelemetry::Instrumentation::Sidekiq::ServerMiddleware)
end
```