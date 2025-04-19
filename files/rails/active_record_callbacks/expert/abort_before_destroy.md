## ⚠️ Aborting Destructive Callbacks with `throw(:abort)`
In `before_destroy` or other `before_*` callbacks, use `throw(:abort)` to cancel the operation gracefully. Raise exceptions only when you need a full rollback; otherwise, `throw(:abort)` is more efficient and idiomatic.

```ruby
class Project < ApplicationRecord
  before_destroy :ensure_no_active_tasks

  private

  def ensure_no_active_tasks
    if tasks.active.exists?
      errors.add(:base, "Cannot destroy a project with active tasks")
      throw(:abort)
    end
  end
end
```

Clients calling `destroy` will get `false` and have access to `project.errors`. This pattern helps you enforce domain constraints without expensive exception handling.