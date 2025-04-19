## 🔧 Implement a Multi-Region Flipper Adapter with Fallback

In latency-sensitive or high-availability setups with multiple Redis clusters, wrap two adapters to read from a primary region and fallback to a secondary on errors. This ensures resilience: writes go only to the primary, and reads transparently recover from failures, providing continuous feature gating across regions.

```ruby
# lib/flipper/multi_region_adapter.rb
class Flipper::Adapters::MultiRegion
  def initialize(primary, fallback)
    @primary, @fallback = primary, fallback
  end

  def add(feature, gate, thing)
    @primary.add(feature, gate, thing)
  rescue StandardError
    @fallback.add(feature, gate, thing)
  end

  def remove(feature, gate, thing)
    @primary.remove(feature, gate, thing)
  rescue StandardError
    @fallback.remove(feature, gate, thing)
  end

  def get(feature)
    @primary.get(feature)
  rescue StandardError
    @fallback.get(feature)
  end

  def features
    (@primary.features + @fallback.features).uniq
  end
end

# config/initializers/flipper.rb
require 'flipper/adapters/multi_region'

redis_primary  = Redis.new(url: ENV['PRIMARY_REDIS'])
redis_fallback = Redis.new(url: ENV['FALLBACK_REDIS'])

primary_adapter  = Flipper::Adapters::Redis.new(redis_primary)
fallback_adapter = Flipper::Adapters::Redis.new(redis_fallback)

Flipper.configure do |config|
  config.adapter = Flipper::Adapters::MultiRegion.new(primary_adapter, fallback_adapter)
end
```
