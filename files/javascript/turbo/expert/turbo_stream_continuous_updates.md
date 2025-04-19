## ⏱ Continuous Streaming with Server-Sent Events
Combine Turbo Streams with Server-Sent Events (SSE) for continuous updates without WebSockets. Create an SSE endpoint emitting Turbo Stream fragments to update live dashboards or logs.

```ruby
# app/controllers/sse_controller.rb
def stream
  response.headers["Content-Type"] = "text/event-stream"
  sse = SSE.new(response.stream)
  loop do
    fragment = render_to_string(partial: "status/line", locals: { line: next_line })
    sse.write({ turboStream: fragment }, event: "turbo-stream")
    sleep 1
  end
rescue IOError
ensure
  sse.close
end
```

```html
<script type="text/javascript">
  const source = new EventSource("/sse/stream");
  source.addEventListener("turbo-stream", e => Turbo.renderStreamMessage(e.data));
</script>
```