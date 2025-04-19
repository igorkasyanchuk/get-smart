## 🏷️ Tag Requests with TaggedLogging
TaggedLogging lets you add contextual tags (like request IDs or user IDs) to your logs, making it easier to filter and trace. By wrapping your `Rails.logger` in `ActiveSupport::TaggedLogging`, each log line will include the tags you set.

You can add tags in a controller or middleware:

```ruby
# config/application.rb
config.log_tags = [ :request_id, ->(req) { "User:#{req.session[:user_id]}" } ]

# or manually in a controller
class ApplicationController < ActionController::Base
  around_action :add_log_tags

  private

  def add_log_tags(&block)
    Rails.logger.tagged("Session:", session.id) { block.call }
  end
end
```

Now each log entry will look like:
```
[Session:] [d3f2e1b4] Started GET "/" for 127.0.0.1
```