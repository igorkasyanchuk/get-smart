## 🧵 Isolate Instances with ActiveSupport::PerThreadRegistry

Use `ActiveSupport::PerThreadRegistry` to store thread-local singletons when integrating with thread‑pooled servers or background jobs. This ensures each thread gets its own instance of a resource (like an external API client) without global state conflicts. The registry lazily builds instances on first access.

```ruby
# lib/api_client.rb
class APIClient
  extend ActiveSupport::PerThreadRegistry

  def self.build
    new(endpoint: ENV['API_ENDPOINT'], token: ENV['API_TOKEN'])
  end

  def initialize(endpoint:, token:)
    @endpoint = endpoint
    @token = token
  end

  def get(path)
    # perform HTTP call...
  end
end

# Usage in any thread-safe context
client = APIClient.instance
client.get('/users')
```
