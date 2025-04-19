## 🏷️ Contextual Logging with ActiveSupport::TaggedLogging
Attach request-specific tags to log lines in multithreaded or background jobs for seamless log correlation. Use custom taggers and dynamic contexts to bind metadata.

```ruby
# config/application.rb
config.logger = ActiveSupport::TaggedLogging.new(Logger.new($stdout))

# In middleware
class TagMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request_id = SecureRandom.uuid
    Rails.logger.tagged("RID=#{request_id}") { @app.call(env) }
  end
end
```

Combine with job IDs in ActiveJob to trace requests through async processes.