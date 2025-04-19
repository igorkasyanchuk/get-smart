## 📡 Simulate Chunked Streaming Responses
Stub chunked HTTP responses to test streaming or long-polling clients. WebMock can yield each chunk via an Enumerator, allowing you to verify how your application handles partial reads, timeouts, or slow connections.

```ruby
require 'webmock'
include WebMock::API

WebMock.disable_net_connect!

# Stub chunked streaming response
stub_request(:get, "https://example.com/stream")
  .to_return(
    status: 200,
    headers: { 'Transfer-Encoding' => 'chunked', 'Content-Type' => 'text/plain' },
    body: Enumerator.new do |y|
      ["chunk1\n", "chunk2\n", "chunk3\n"].each do |chunk|
        sleep 0.1
        y << chunk
      end
    end
  )

# Client code to consume the stream
uri = URI("https://example.com/stream")
Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
  http.request_get(uri.request_uri) do |response|
    response.read_body do |fragment|
      puts "Received fragment: #{fragment}"
    end
  end
end
```