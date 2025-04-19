## 🎯 Defining and Accessing Constants

Constants in Ruby are used to store values that shouldn’t change at runtime, like configuration values or fixed thresholds. You can define them at the top level or inside classes and modules, then reference them directly by name.

```ruby
# Top-level constant
timeout_seconds = 5
DEFAULT_TIMEOUT = 5

# Inside a class
class ApiClient
  MAX_RETRIES = 3

  def fetch
    retries = 0
    while retries < MAX_RETRIES
      # perform request
      retries += 1
    end
  end
end

puts DEFAULT_TIMEOUT       # => 5
puts ApiClient::MAX_RETRIES  # => 3
```