## 🚀 Generating a Chat Channel

Action Cable channels are the foundation for real-time features in Rails. You can generate a channel quickly using the Rails generator and define streaming behavior in the channel class.

```bash
rails generate channel Chat
```

```ruby
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
  end
end
```
