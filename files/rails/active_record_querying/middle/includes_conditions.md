## 🔗 Eager Loading Conditions with `includes` and `references`

To avoid the N+1 problem while filtering on associations, combine `includes` with `references` and `where`. `references` tells Rails to generate proper JOINs for the `WHERE` clause.

```ruby
# Fetch posts that have comments by author with ID 42
posts = Post.includes(:comments)
            .references(:comments)
            .where(comments: { author_id: 42 })
```