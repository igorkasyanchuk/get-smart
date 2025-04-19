## 🚀 Custom `inverse_of` for Complex Joins

Defining `inverse_of` on associations can prevent N+1 queries when you mutate in-memory objects. In multi-join scenarios, explicitly set `inverse_of` to help Rails reuse loaded instances.

```ruby
class Author < ApplicationRecord
  has_many :authorships, inverse_of: :author
  has_many :books, through: :authorships, inverse_of: :author_books
end

class Book < ApplicationRecord
  has_many :authorships, inverse_of: :book
  has_many :authors, through: :authorships, inverse_of: :book_authors
end
```
