## 📦 Stream Large Responses to Reduce Memory Footprint

When downloading large payloads you can yield chunks as they arrive to avoid loading the entire response into memory. Use `Net::HTTP.start` with a block and `response.read_body` to process data incrementally, which is perfect for file downloads or streaming APIs.

```ruby
uri = URI('https://example.com/large-file.zip')
Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
  request = Net::HTTP::Get.new(uri)
  http.request(request) do |response|
    File.open('large-file.zip', 'wb') do |file|
      response.read_body do |chunk|
        file.write(chunk)
      end
    end
  end
end
```