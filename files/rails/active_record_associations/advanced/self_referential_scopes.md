## 🔄 Self-Referential Associations with Scoped Relations
Define self-referential associations with custom scopes to build powerful relationship graphs (e.g., followers, friends). You can apply conditions on join models to separate accepted vs. pending records. This pattern keeps your user model clean and your queries performant.

```ruby
class User < ApplicationRecord
  has_many :friendships, -> { where(status: 'accepted') },
           class_name: 'Friendship', foreign_key: 'user_id'
  has_many :accepted_friends, through: :friendships, source: :friend

  has_many :pending_friendships, -> { where(status: 'pending') },
           class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend
end

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
```