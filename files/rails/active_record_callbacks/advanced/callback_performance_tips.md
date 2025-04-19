## ⚡ Tip: Optimizing Callback Performance

Heavy callback logic can slow down record lifecycle. Offload expensive operations to background jobs and guard callbacks with quick checks.

```ruby
class Report < ApplicationRecord
  before_save :validate_metrics
  after_save :enqueue_analysis, if: -> { analysis_required? }

  private

  def enqueue_analysis
    AnalysisJob.perform_later(self.id)
  end
end
```

Ensuring time‑sensitive work runs asynchronously keeps your web requests snappy.