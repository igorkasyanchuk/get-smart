## 🛠️ Dynamic Association Extension Methods

You can inject custom methods directly into an association proxy by passing a block to `has_many`. This provides an elegant way to encapsulate complex queries and behaviors.

```ruby
class Project < ApplicationRecord
  has_many :tasks do
    def completed_count
      where(status: 'done').count
    end

    def overdue
      where('due_date < ?', Time.current)
    end
  end
end

project = Project.first
project.tasks.completed_count
project.tasks.overdue
```
