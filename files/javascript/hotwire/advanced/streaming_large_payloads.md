## 📡 Streaming Large Payloads via Turbo Streams
For large binary or text data, chunk and stream parts as separate Turbo Stream messages. This reduces jank and keeps UI responsive.

```ruby
# controller
def download
  response.headers['Content-Type'] = 'text/vnd.turbo-stream.html'
  self.response_body = Enumerator.new do |y|
    File.open(@big_file, 'r').each(1.kilobyte) do |chunk|
      y << turbo_stream.append('output', chunk)
    end
  end
end
```

Turbo will append each chunk to your `#output` container in near real‑time.