## 🔗 Multi-level Through Association Aliases

You can chain multiple `has_many :through` associations and alias them for readability in large domains. This pattern helps you traverse several join models in one step, improving code clarity and avoiding nested queries.

```ruby
class User < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :team_projects, through: :teams, source: :projects, class_name: 'Project'
end

class Team < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :projects
end
```
