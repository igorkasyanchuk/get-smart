## 🧪 Test Background Jobs with RSpec Helpers

Leverage `ActiveJob::TestHelper` in RSpec to assert job enqueuing and execution. Use `perform_enqueued_jobs` and `assert_enqueued_with` to keep your job logic covered without hitting Redis in tests.

```ruby
# spec/rails_helper.rb
RSpec.configure do |config|
  config.include ActiveJob::TestHelper
end
```

```ruby
# spec/jobs/email_reminder_job_spec.rb
require 'rails_helper'

RSpec.describe EmailReminderJob, type: :job do
  it 'enqueues and runs the job' do
    expect {
      EmailReminderJob.perform_later(42)
    }.to have_enqueued_job(EmailReminderJob).with(42)

    perform_enqueued_jobs do
      EmailReminderJob.perform_later(42)
    end
    # Add assertions for side effects here
  end
end
```