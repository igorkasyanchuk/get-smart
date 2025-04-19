## 🔐 Store Sessions in Redis

Storing Rails sessions in Redis offloads session management from the database and improves performance for high-traffic apps. You can configure session expiration and namespace isolation to keep session data organized.

```ruby
# Gemfile
gem 'redis-rails'

# config/initializers/session_store.rb
Rails.application.config.session_store :redis_store, {
  servers: [{ url: ENV['REDIS_URL'], namespace: 'session' }],
  expire_after: 30.minutes,
  key: '_myapp_session'
}
```