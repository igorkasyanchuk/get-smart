## 🧠 Memoize Expensive Method Results with `||=`

When you have a method that performs an expensive computation or external call, memoization prevents repeated work by caching the result in an instance variable. Use the `||=` operator to assign the value only once. This pattern keeps your methods idempotent and speeds up subsequent calls.

```ruby
class WeatherClient
  def temperature
    @temperature ||= fetch_temperature_from_api  # stored after first call
  end

  private

  def fetch_temperature_from_api
    # simulate expensive HTTP request
    sleep 1
    22
  end
end

client = WeatherClient.new
puts client.temperature  # => 22 (after 1 second)
puts client.temperature  # => 22 (instant)
```