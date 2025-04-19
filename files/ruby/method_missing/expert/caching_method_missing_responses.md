## 🧠 Caching Dynamic Method Results Safely
For expensive dynamic lookups, implement a cache inside `method_missing` to memoize results. Invalidate or expire entries carefully to avoid stale data. This pattern works well for on‑the‑fly computation of attributes from remote services or large data sources.

```ruby
class RemoteAttributeFetcher
  def initialize(client)
    @client = client
    @cache  = {}
  end

  def method_missing(name, *_args)
    return super unless name.to_s.start_with?('fetch_')

    @cache[name] ||= begin
      attribute = name.to_s.sub('fetch_', '')
      @client.get(attribute)  # potentially slow network call
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?('fetch_') || super
  end

  def clear_cache(method_name = nil)
    if method_name
      @cache.delete(method_name)
    else
      @cache.clear
    end
  end
end

fetcher = RemoteAttributeFetcher.new(api_client)
fetcher.fetch_price   # cached on first call
fetcher.clear_cache(:fetch_price)
fetcher.fetch_price   # refetched from service
```