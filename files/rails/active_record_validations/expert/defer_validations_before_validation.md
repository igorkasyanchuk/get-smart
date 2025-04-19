## ⏳ Deferring Validations with before_validation
Use `before_validation` to mutate or load data just-in-time, ensuring validations see the final state. This pattern is critical when default values or external lookups need to populate attributes before validation runs.

```ruby
# app/models/invoice.rb
class Invoice < ApplicationRecord
  before_validation :set_default_due_date, on: :create
  validates :due_date, presence: true, timeliness: { on_or_after: :today }

  private

  def set_default_due_date
    self.due_date ||= created_at&.to_date + default_term.days || Time.zone.today + default_term.days
  end

  def default_term
    Rails.configuration.x.invoice.default_term_days
  end
end
```