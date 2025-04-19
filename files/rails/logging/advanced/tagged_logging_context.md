## 🏷️ Advanced Tagged Logging

Leverage `ActiveSupport::TaggedLogging` to inject dynamic context (such as user IDs, subdomain, or custom headers) into each log line. Wrap your controller stack to automatically tag all log entries without manually passing parameters.

```ruby
# app/middleware/log_tags_middleware.rb
class LogTagsMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)
    Rails.logger.tagged("User:#{request.session[:user_id]}", "Host:#{request.host}") do
      @app.call(env)
    end
  end
end

# config/application.rb
config.middleware.insert_before Rails::Rack::Logger, LogTagsMiddleware
```