## ⏱️ Response Timing and Performance Middleware
Measure performance at the middleware layer to identify slow requests across your application. You can push metrics to services like Prometheus or StatsD. Use Rack env to tag routes and push histogram metrics.

```ruby
# app/middleware/response_timing_middleware.rb
require 'statsd'

class ResponseTimingMiddleware
  def initialize(app)
    @app = app
    @statsd = Statsd.new('localhost', 8125)
  end

  def call(env)
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    status, headers, response = @app.call(env)
    duration_ms = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time) * 1000).round

    route = env['PATH_INFO'].gsub('/', '_').sub(/^_/, '')
    @statsd.histogram("rails.request.#{route}", duration_ms)

    [status, headers, response]
  end
end

# config/application.rb
config.middleware.use ResponseTimingMiddleware
```
