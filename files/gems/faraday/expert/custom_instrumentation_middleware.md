## 🚀 Build Custom Instrumentation Middleware

When you need fine‑grained telemetry on each HTTP interaction, creating a custom Faraday middleware lets you hook into the request lifecycle. You can capture timings, response codes, or custom tags and push them into your metrics backend. This pattern avoids scattering instrumentation across your app and centralizes it in the HTTP layer.

```ruby
# lib/faraday/instrumentation_middleware.rb
require 'faraday'

class InstrumentationMiddleware < Faraday::Middleware
  def call(env)
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    @app.call(env).on_complete do |response_env|
      duration = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time
      # Push metrics to your monitoring system
      Metrics.increment('http.request.count', tags: { method: env.method, host: env.url.host })
      Metrics.observe('http.request.duration', duration, tags: { method: env.method })
    end
  end
end

# Usage in your Faraday connection
conn = Faraday.new(url: 'https://api.example.com') do |f|
  f.use InstrumentationMiddleware         # Insert before adapter
  f.adapter Faraday.default_adapter        # e.g., :net_http
end
```