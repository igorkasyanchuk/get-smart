## 🛠️ Install and Configure solid_queue

To get started with solid_queue, add it to your Gemfile and bundle install. Then configure the Redis connection using an initializer so your jobs know where to be stored and fetched.

```ruby
# Gemfile
gem 'solid_queue', '~> 1.0'
```

```bash
# Install the gem
docker-compose exec app bundle install
# or locally
bundle install
```

```ruby
# config/initializers/solid_queue.rb
SolidQueue.configure do |config|
  config.redis_url = ENV.fetch('REDIS_URL', 'redis://localhost:6379/0')
end
```