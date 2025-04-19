## 🔄 Real‑time Incremental Updates with Turbo Streams
Use Turbo Streams to patch parts of the page as soon as your back end broadcasts updates. Ideal for chat apps or live dashboards.

```ruby
# app/models/message.rb
after_create_commit { broadcast_append_to "chat_#{chat_id}" }
```

```html
<!-- subscribe in view -->
<turbo-cable-stream-source channel="ChatChannel" />
<turbo-stream-source src="/chats/1/stream" />
<div id="messages"></div>
```

Turbo will append new messages to `#messages` automatically.