## 🚀 Streaming with ActionController::Live

Use `ActionController::Live` to push real-time data directly to clients without polling. This approach leverages Rack’s streaming API and keeps the HTTP connection open, allowing you to send server‐sent events or chunked responses. Remember to close the stream in an `ensure` block to avoid connection leaks.

```ruby
class StreamsController < ApplicationController
  include ActionController::Live

  def events
    response.headers['Content-Type'] = 'text/event-stream'

    10.times do |i|
      response.stream.write "data: Event ##{i} at #{Time.now}\n\n"
      sleep 1
    end
  ensure
    response.stream.close
  end
end
```