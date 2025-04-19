## 🔗 Preventing N+1 with inverse_of and Eager Preloading
Use `inverse_of` to enable proper in-memory associations and combine it with `includes` or `preload` for nested relations. This ensures ActiveRecord only fires the minimal queries needed, even on deep `has_many :through` trees.

```ruby
class Author < ApplicationRecord
  has_many :books, inverse_of: :author
end

class Book < ApplicationRecord
  belongs_to :author, inverse_of: :books
  has_many :reviews, inverse_of: :book
end

# Fetch authors, books, and reviews in 3 queries instead of N+1
authors = Author.includes(books: :reviews).where(active: true)
authors.each do |author|
  author.books.each { |book| puts book.reviews.size }
end
```