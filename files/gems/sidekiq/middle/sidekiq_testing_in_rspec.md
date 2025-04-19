## 🧪 Test Jobs with RSpec and sidekiq/testing
In your test suite, switch Sidekiq to `fake` or `inline` modes to assert job enqueueing or execution. This isolates sidekiq behavior without hitting Redis.

```ruby
# spec/spec_helper.rb or rails_helper.rb
require 'sidekiq/testing'
Sidekiq::Testing.fake!   # jobs are pushed to queues but not executed
# Sidekiq::Testing.inline! # would run jobs immediately

# Example spec
describe NotificationWorker do
  it 'enqueues a job' do
    expect {
      NotificationWorker.perform_async(123)
    }.to change(NotificationWorker.jobs, :size).by(1)
  end
end
```
