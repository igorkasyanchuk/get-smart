## 📊 High-Performance Binary Data Streaming
Stream large or binary content (e.g., audio, video frames) over WebSockets by using ActionCable’s `transmit` with raw binary payloads. This approach minimizes JSON overhead and achieves near real-time throughput.

```ruby
# app/channels/stream_channel.rb
class StreamChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stream_#{params[:session_id]}"
  end

  def send_chunk(data)
    binary = Base64.decode64(data['chunk'])
    ActionCable.server.broadcast("stream_#{params[:session_id]}", binary)
  end
end
```

```javascript
// app/javascript/channels/stream_channel.js
import consumer from "../channels/consumer"

const channel = consumer.subscriptions.create(
  { channel: "StreamChannel", session_id: "abc123" },
  {
    received(binary) {
      // handle ArrayBuffer binary data
      playAudio(new Uint8Array(binary))
    }
  }
)
```

This method uses Base64 for transport safety then decodes on the server, streaming raw bytes for low-latency consumption.