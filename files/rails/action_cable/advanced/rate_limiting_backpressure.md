## 🛑 Rate Limiting & Backpressure
Implement backpressure to prevent flooding clients or overwhelming your server. Use an internal queue and process messages at a controlled rate, waiting for client acknowledgments before sending more.

```ruby
# app/channels/throttled_channel.rb
class ThrottledChannel < ApplicationCable::Channel
  def subscribed
    @queue = []
    @processing = false
    stream_from stream_name
  end

  def receive(data)
    @queue << data["payload"]
    process_queue unless @processing
  end

  private
  def stream_name
    "throttle_#{current_user.id}"
  end

  def process_queue
    @processing = true
    while payload = @queue.shift
      result = heavy_compute(payload)
      ActionCable.server.broadcast(stream_name, result: result)
      # wait for client ack before continuing
      sleep 0.2
    end
  ensure
    @processing = false
  end
end
```

On the client side, send back an `ack` message once processed to fine-tune the delay.