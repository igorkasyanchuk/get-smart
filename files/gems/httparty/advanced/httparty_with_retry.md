## 🔄 Implementing Retries with Exponential Backoff

HTTParty doesn’t provide built‑in retry logic, but you can wrap requests to handle transient failures. Here’s how to add exponential backoff and retry on 5xx or network errors by extending `HTTParty::Request`.

```ruby
require 'httparty'

module HTTParty
  class Request
    alias_method :orig_perform, :perform

    def perform(&block)
      retries = 0
      begin
        orig_perform(&block)
      rescue Errno::ETIMEDOUT, Errno::ECONNREFUSED, Net::OpenTimeout, Net::ReadTimeout, SocketError, HTTParty::Error => e
        if retries < 3
          backoff = (2 ** retries) + rand
          sleep(backoff)
          retries += 1
          retry
        end
        raise e
      end
    end
  end
end

class ResilientClient
  include HTTParty
  base_uri 'https://unstable-api.example.com'

  def fetch_resources
    self.class.get('/resources')
  end
end

client = ResilientClient.new
puts client.fetch_resources.code # will retry up to 3 times on failure
```