## 🔗 Set Up Associations with `has_many` and `belongs_to`

Associations let you connect models and fetch related records effortlessly. Use `belongs_to` on the child model and `has_many` on the parent. Rails will auto-generate helper methods for easy traversal.

```ruby
class Author < ApplicationRecord
  has_many :books
end

class Book < ApplicationRecord
  belongs_to :author
end

# Fetch an author's books
author = Author.find(1)
author.books
```  
