## 🔒 Advanced Optimistic Locking Usage

Use `lock_version` to detect concurrent updates and implement retry logic. Wrap updates in transactions and handle `ActiveRecord::StaleObjectError` to ensure data integrity under concurrency.

```ruby
class Account < ApplicationRecord
  # ensure lock_version column exists
end

# Service
def transfer_funds(from_account, to_account, amount)
  Account.transaction do
    from_account.lock!
    to_account.lock!

    from_account.balance -= amount
    to_account.balance   += amount

    from_account.save!
    to_account.save!
  end
rescue ActiveRecord::StaleObjectError
  retry
end
```