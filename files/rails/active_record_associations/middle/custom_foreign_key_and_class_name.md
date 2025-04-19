## 🔑 Custom Foreign Keys and `class_name`

When your database naming deviates from Rails conventions, specify `foreign_key:` and `class_name:` to wire associations correctly. This flexibility allows you to integrate legacy schemas or complex designs without renaming tables or columns.

```ruby
class Employee < ApplicationRecord
  # Department table uses manager_id, but we want manager to be an Employee
  belongs_to :manager, class_name: "Employee", foreign_key: "manager_id"
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
end
```
