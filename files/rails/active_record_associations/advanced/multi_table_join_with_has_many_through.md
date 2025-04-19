## 💠 Multi-Table Join with has_many Through
Chain multiple join models to navigate complex many-to-many relationships across tables. This lets you reach deeply nested resources via concise association calls. It avoids manual SQL and keeps your AR models expressive.

```ruby
class Company < ApplicationRecord
  has_many :departments
  has_many :teams, through: :departments
  has_many :members, through: :teams, source: :users
end

class Department < ApplicationRecord
  belongs_to :company
  has_many :teams
end

class Team < ApplicationRecord
  belongs_to :department
  has_many :users
end
```