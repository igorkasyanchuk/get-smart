## ⚡️ Perform Concurrent Requests with Threads

Ruby's `Net::HTTP` isn't asynchronous by default, but you can dispatch multiple requests in parallel using threads or thread pools. This pattern accelerates batch operations, such as fetching multiple API endpoints concurrently, and can significantly reduce total latency.

```ruby
uris = [
  URI('https://api.example.com/user'),
  URI('https://api.example.com/order'),
  URI('https://api.example.com/product')
]
responses = []

threads = uris.map do |uri|
  Thread.new do
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      response = http.get(uri.request_uri)
      responses << { uri: uri, status: response.code, body: response.body }
    end
  end
end

threads.each(&:join)
puts responses
```