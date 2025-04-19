## 🧹 Clean Up Streams in unsubscribed

Prevent dangling subscriptions by stopping streams explicitly when a client disconnects. Use `stop_all_streams` or `stop_stream_from` in your channel's `unsubscribed` method.

```ruby
# app/channels/chat_room_channel.rb
class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    @stream_name = "chat_room_#{params[:room_id]}_messages"
    stream_from @stream_name
  end

  def unsubscribed
    stop_stream_from @stream_name
    # or use stop_all_streams to remove every stream
    # stop_all_streams
  end
end
```