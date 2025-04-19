## 🚀 Batch Operations with after_commit on: :create
If you need to enqueue jobs for each record in a bulk insert, use `after_commit on: :create` alongside `insert_all` and call callbacks manually.

```ruby
class Report < ApplicationRecord
  after_commit :generate_pdf, on: :create

  def self.bulk_create_and_enqueue(reports)
    insert_all(reports)
    where(created_at: Time.zone.today.all_day).find_each(&:run_callbacks)
  end

  def generate_pdf
    PdfGeneratorJob.perform_later(self.id)
  end
end
```

This pattern ensures each new `Report` triggers its `after_commit` callback for job enqueuing.