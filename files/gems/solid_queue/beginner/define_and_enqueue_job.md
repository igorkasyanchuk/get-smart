## 🚀 Define and Enqueue a Job

Create a job class by inheriting from `SolidQueue::Job` and implement the `perform` method with your task logic. Then enqueue it anywhere in your app to run asynchronously.

```ruby
# app/jobs/greeting_job.rb
class GreetingJob < SolidQueue::Job
  def perform(name)
    puts "Hello, #{name}!"
  end
end
```

```ruby
# Enqueue the job (e.g., in a controller or rake task)
job_id = GreetingJob.perform_async('Alice')
puts "Enqueued job with ID: ", job_id
```