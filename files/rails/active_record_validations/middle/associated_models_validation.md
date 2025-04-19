## 🔗 Validating Associated Models
Ensure nested or associated records are valid before saving the parent. Use `validates_associated` or configure `accepts_nested_attributes_for` together with validations on child models to enforce integrity.

```ruby
class Project < ApplicationRecord
  has_many :tasks
  validates_associated :tasks
  accepts_nested_attributes_for :tasks
end

class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true
end
```
