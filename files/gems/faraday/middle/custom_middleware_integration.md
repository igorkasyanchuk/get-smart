## 🔌 Custom Middleware Integration
Faraday allows you to inject your own middleware into the request/response pipeline to encapsulate cross-cutting concerns like logging, instrumentation, or custom headers. By defining and registering a middleware class, you can keep your code DRY and easier to test.

First, create a custom middleware that inherits from `Faraday::Middleware` or `Faraday::Response::Middleware`:

```ruby
# lib/faraday/middleware/add_request_id.rb
require 'faraday'

module Faraday
  module Middleware
    class AddRequestId < Faraday::Middleware
      def call(env)
        env.request_headers['X-Request-ID'] ||= SecureRandom.uuid
        @app.call(env)
      end
    end
  end
end
```

Next, register and use it when building your connection:

```ruby
require 'faraday'
require_relative 'middleware/add_request_id'

Faraday::Middleware.register_middleware add_request_id: Faraday::Middleware::AddRequestId

conn = Faraday.new(url: 'https://api.example.com') do |faraday|
  faraday.request  :json                    # encode req bodies as JSON
  faraday.response :logger, bodies: true    # log requests & responses
  faraday.use      :add_request_id          # inject your custom middleware
  faraday.adapter  Faraday.default_adapter # make requests
end

response = conn.get('/resources')
puts response.headers['X-Request-ID']