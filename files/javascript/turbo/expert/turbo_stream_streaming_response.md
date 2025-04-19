## 🌊 Turbo Frame HTTP/2 Server Push with Streaming
If your server supports HTTP/2 push, stream Turbo Stream messages directly in a single persistent response. This exploits multiplexing to reduce handshake overhead for live dashboards.

```ruby
# app/controllers/live_controller.rb
def index
  response.headers["Content-Type"] = "text/vnd.turbo-stream.html; charset=utf-8"
  self.response_body = Enumerator.new do |yielder|
    loop do
      yielder << render_to_string(partial: "live/update", locals: { data: fetch_live_data })
      sleep 1
    end
  end
end
```

```html
<turbo-frame id="live-updates"></turbo-frame>
```