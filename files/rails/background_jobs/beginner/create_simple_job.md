## ⚙️ Create a Simple Active Job

Rails’ Active Job provides a standard interface for queueing jobs. Generate a new job and implement your business logic in the `perform` method.

```bash
# generate a job named HardWorker
rails generate job HardWorker
```

```ruby
# app/jobs/hard_worker_job.rb
class HardWorkerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Your background task goes here
    puts "Working hard on: #{args.inspect}"
  end
end
```