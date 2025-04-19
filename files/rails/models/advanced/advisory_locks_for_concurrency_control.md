## 🧠 Using PostgreSQL Advisory Locks in Models

Use PostgreSQL advisory locks to serialize complex operations across processes. This avoids deadlocks and race conditions without blocking unrelated transactions.

```ruby
class Report < ApplicationRecord
  def generate_with_lock
    lock_id = 