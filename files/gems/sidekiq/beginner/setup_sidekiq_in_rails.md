## 🛠️ Install and Configure Sidekiq

Sidekiq runs background jobs in Rails using Redis. To get started, add the Sidekiq gem to your Gemfile and create an initializer to configure the Redis connection.

```ruby
# Gemfile
gem 'sidekiq'

# Then install:
bundle install
```

```ruby
# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0') }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0') }
end
```