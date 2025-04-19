## 📬 Chaining Callbacks with Dynamic Conditions
Leverage Procs in `if`/`unless` options to build dynamic callback chains. This is essential when callback invocation depends on multiple runtime factors.

```ruby
class Invoice < ApplicationRecord
  before_save :apply_late_fee, if: ->(invoice) { invoice.due_date.past? && invoice.amount_outstanding > 0 }
  after_save :send_reminder_email, unless: ->(invoice) { invoice.paid? }

  private

  def apply_late_fee
    self.late_fee = calculate_fee
  end

  def send_reminder_email
    ReminderMailer.remind(self).deliver_later
  end
end
```

Condition Procs are evaluated per record and support arbitrary business logic, giving you fine-grained control over the callback flow.