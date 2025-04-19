## ⚡ Advanced Stale-While-Revalidate Caching

Implement a reverse‐proxy–style middleware that serves stale GET responses while asynchronously revalidating the cache. This ensures sub-second responses under load and gradually refreshes your cache in the background. Use Redis (or Memcached) for storage, spin off a separate thread for revalidation, and attach ETag headers for conditional updates.

```ruby
class StaleWhileRevalidate
  def initialize(app, store:, ttl: 300)
    @app  = app
    @store = store
    @ttl  = ttl
  end

  def call(env)
    return @app.call(env) unless env['REQUEST_METHOD'] == 'GET'

    cache_key = "swrr:#{env['PATH_INFO']}"
    entry = @store.get(cache_key)

    if entry && Time.now.to_i - entry[:fetched_at] < @ttl
      headers = entry[:headers].merge('X-Cache' => 'HIT')
      return [entry[:status], headers, [entry[:body]]]
    end

    if entry
      Thread.new { revalidate(env, cache_key) }
      headers = entry[:headers].merge('X-Cache' => 'STALE')
      return [entry[:status], headers, [entry[:body]]]
    end

    status, headers, body = @app.call(env)
    full_body = '' ; body.each { |chunk| full_body << chunk }
    @store.set(cache_key, {status: status, headers: headers, body: full_body, fetched_at: Time.now.to_i}, ex: @ttl)
    [status, headers.merge('X-Cache' => 'MISS'), [full_body]]
  end

  private

  def revalidate(env, key)
    status, headers, body = @app.call(env.dup)
    full_body = '' ; body.each { |chunk| full_body << chunk }
    @store.set(key, {status: status, headers: headers, body: full_body, fetched_at: Time.now.to_i}, ex: @ttl)
  end
end

# config/application.rb
Rails.application.config.middleware.use StaleWhileRevalidate,
  store: Redis.new(url: ENV['REDIS_URL']), ttl: 120
```