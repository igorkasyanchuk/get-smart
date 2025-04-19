## 🏗️ Presence Validation on Nested Attributes
Ensure that nested attributes are present when using forms. Pair `accepts_nested_attributes_for` with `validates_presence_of` on the child model for reliable form errors.

```ruby
class Survey < ApplicationRecord
  has_many :questions
  accepts_nested_attributes_for :questions
end

class Question < ApplicationRecord
  belongs_to :survey
  validates :content, presence: true
end
```
