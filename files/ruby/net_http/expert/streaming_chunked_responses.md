## 📡 Stream Large Responses with Chunked Reading

When fetching huge payloads or media, loading the entire body into memory can lead to OOM. Net::HTTP lets you process incoming chunks on the fly via block iteration, implementing backpressure or piping directly into files or sockets.

```ruby
require 'net/http'

uri = URI('https://bigdata.example.com/stream')
Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
  request = Net::HTTP::Get.new(uri)
  http.request(request) do |response|
    File.open('output.dat', 'wb') do |file|
      response.read_body do |chunk|
        file.write(chunk)
        # Optionally: throttling or monitoring per-chunk metrics
      end
    end
  end
end
```

This pattern ensures minimal memory footprint and lets you plug in real‑time processing (e.g., parsing CSV lines or pushing to a queue).