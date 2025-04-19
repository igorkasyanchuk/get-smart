## 👷 Create a Basic Worker

Workers are the core units in Sidekiq. Define a Ruby class that includes `Sidekiq::Worker` and implement a `perform` method which will execute in the background.

```ruby
# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker

  # Arguments: user name (String), count (Integer)
  def perform(name, count)
    count.times { puts "Doing hard work for #{name}" }
  end
end
```