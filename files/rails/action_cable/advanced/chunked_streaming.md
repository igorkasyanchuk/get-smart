## 📡 Chunked Binary Streaming
Action Cable can stream large binary files (e.g., videos, archives) in manageable chunks. This prevents memory bloat on the server and allows clients to progressively render or download data. Below is an example of chunking a file and broadcasting base64-encoded segments.

```ruby
# app/channels/streaming_channel.rb
class StreamingChannel < ApplicationCable::Channel
  def subscribed
    stream_from stream_name
    chunk_file
  end

  private
  def stream_name
    "streaming_#{params[:file_id]}"
  end

  def chunk_file
    File.open(Rails.root.join("public", params[:file_id]), "rb") do |file|
      until file.eof?
        data = Base64.strict_encode64(file.read(64.kilobytes))
        ActionCable.server.broadcast(stream_name, chunk: data)
        sleep 0.1  # throttle as needed
      end
    end
  end
end
```

Clients can subscribe to the channel and decode/append chunks in JavaScript.