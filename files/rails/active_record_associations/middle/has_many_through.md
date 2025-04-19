## 🔗 Using `has_many :through` for multi-step associations

The `has_many :through` association allows you to link models via a join model and work with that join record directly. This is ideal when you need to store extra attributes on the join or customize callbacks on the relationship. Use the join model to validate or query association-specific data efficiently.

```ruby
class Author < ApplicationRecord
  has_many :authorships
  has_many :books, through: :authorships
end

class Authorship < ApplicationRecord
  belongs_to :author
  belongs_to :book
  validates :role, presence: true
end

class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, through: :authorships
end
```
