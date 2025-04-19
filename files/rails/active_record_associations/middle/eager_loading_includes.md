## 🎯 Preventing N+1 Queries with `includes` and `references`

Use `includes` to eager-load associated records and avoid N+1 query problems. If you need to filter or order on the joined table’s columns, chain `references` to generate proper SQL joins.

```ruby
# Without includes: many separate queries for each book.author
books = Book.all
books.each { |b| puts b.author.name }

# With includes:
books = Book.includes(:author).where("authors.active = true").references(:author)
books.each { |b| puts b.author.name }
```
