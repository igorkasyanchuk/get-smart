## 📈 Autoscale Sidekiq Concurrency Based on Queue Latency

Leverage sidekiq-autoscaler to dynamically adjust concurrency based on real-time queue latency metrics. This reduces over-provisioning and adapts to load spikes.

```ruby
# Gemfile
gem 'sidekiq-autoscaler'

# config/initializers/sidekiq_autoscaler.rb
require 'sidekiq/autoscaler'

Sidekiq.autoscaler.configure do |c|
  c.interval = 5               # seconds between metrics checks
  c.queues  = ['critical', 'default', 'low']
  c.min     = 5               # minimum concurrency
  c.max     = 50              # maximum concurrency
  c.latency_threshold = 1.0   # raise workers if latency > 1s
end

# start Sidekiq with autoscaler
# bundle exec sidekiq -r ./config/initializers/sidekiq_autoscaler.rb
```