## 📬 Testing ActiveJob with Test Adapter

Switch to the `:test` adapter to inspect enqueued jobs without performing them. Use `have_enqueued_job` matcher for declarative checks or `perform_enqueued_jobs` to run them inline.

```ruby
# spec/jobs/send_welcome_email_job_spec.rb
describe SendWelcomeEmailJob, type: :job do
  around do |example|
    ActiveJob::Base.queue_adapter = :test
    example.run
    ActiveJob::Base.queue_adapter = :async
  end

  it 'enqueues the job' do
    expect {
      SendWelcomeEmailJob.perform_later(user_id: 1)
    }.to have_enqueued_job(SendWelcomeEmailJob).with(user_id: 1).on_queue('default')
  end

  it 'executes the job when performed' do
    perform_enqueued_jobs do
      SendWelcomeEmailJob.perform_later(user_id: 1)
    end

    # assert side effects, e.g. email delivery
    expect(ActionMailer::Base.deliveries.last.to).to include('user@example.com')
  end
end
```
