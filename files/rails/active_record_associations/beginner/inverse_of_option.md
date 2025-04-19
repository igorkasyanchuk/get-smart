## 🔄 Improve Performance with `inverse_of`

`inverse_of` helps Rails avoid extra queries by linking objects in memory. Specify it on both sides of the association.

```ruby
# app/models/author.rb
class Author < ApplicationRecord
  has_many :books, inverse_of: :author
end

# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :author, inverse_of: :books
end
```

Now `book.author.books.first` uses the same `Author` instance, reducing database calls.
