## 🔍 Through Associations with Custom Conditions
Enhance `has_many :through` by embedding query conditions directly into the association. This approach yields focused subsets (e.g., active tasks) without manual scopes at call time. It also plays nicely with eager loading to cut down on ad-hoc filtering.

```ruby
class Project < ApplicationRecord
  has_many :tasks
  has_many :active_tasks,
           -> { where(status: 'active').order(:due_date) },
           through: :tasks,
           source: :task
end

class Task < ApplicationRecord
  belongs_to :project
end
```