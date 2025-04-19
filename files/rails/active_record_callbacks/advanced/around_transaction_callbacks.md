## 🔄 Tip: Around Callbacks for Transaction Management

Use `around_*` callbacks to wrap operations in a transaction or custom context. This is helpful when you need to enforce atomicity or resource setup/teardown.

```ruby
class Invoice < ApplicationRecord
  around_save :with_audit_log

  private

  def with_audit_log
    ActiveRecord::Base.transaction do
      AuditLog.create!(action: 'invoice_save', record: self)
      yield
    end
  end
end
```

This pattern guarantees that both your audit log and the record save happen in the same transaction.