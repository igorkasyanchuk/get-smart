## 🚀 Enqueue Jobs with `perform_later`

Use `perform_later` to push your job onto the queue. This call returns immediately, letting web requests finish faster.

```ruby
# In a controller action
class ReportsController < ApplicationController
  def create
    # Enqueue the job and pass the report ID
    ReportGenerationJob.perform_later(current_user.id)
    redirect_to reports_path, notice: "Report is being generated!"
  end
end
```

```bash
# Or from Rails console:
rails c
ReportGenerationJob.perform_later(42)
```