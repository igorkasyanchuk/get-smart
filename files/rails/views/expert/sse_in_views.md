## 📦 Implement Server-Sent Events in Views
Stream real-time updates without WebSockets by using Rails SSE in views. Ideal for live notifications or progress bars, SSE keeps an open HTTP connection sending events as plain text.

```ruby
# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    begin
      loop do
        message = Notification.fetch_next
        sse.write(message, event: 'notification')
        sleep 1
      end
    ensure
      sse.close
    end
  end
end
```

Client-side subscription:

```js
const source = new EventSource('/notifications/stream')
source.addEventListener('notification', e => console.log(e.data))
```