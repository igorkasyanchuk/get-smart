## 🔒 Validating Associated Records with `validates_associated`

Use `validates_associated` to ensure that child records are valid whenever the parent is saved. This enforces data integrity across nested forms or complex object graphs. Keep in mind it triggers validations on each associated object, which may impact performance if overused.

```ruby
class Library < ApplicationRecord
  has_many :books
  validates_associated :books
end

class Book < ApplicationRecord
  validates :title, presence: true
end
```