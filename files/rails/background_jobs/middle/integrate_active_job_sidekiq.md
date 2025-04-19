## 🚀 Use Active Job with Sidekiq Adapter

Active Job provides a unified interface for various queue adapters, and Sidekiq is a popular choice for Redis-backed concurrency. Configure your Rails app to use Sidekiq in `config/application.rb`, then define jobs inheriting from `ApplicationJob` and enqueue them with `perform_later`.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq
  end
end
```

```ruby
# app/jobs/hard_work_job.rb
class HardWorkJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # long-running task
  end
end

# Enqueue from anywhere in your app
HardWorkJob.perform_later(arg1, arg2)
```