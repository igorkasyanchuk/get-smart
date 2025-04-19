## 📦 Avoid N+1 Queries with `includes` and `references`

Use `includes` to preload associations and reduce database hits. If you need to filter or sort on associated tables, combine with `references`.

```ruby
# Load posts with their authors to avoid N+1:
posts = Post.includes(:author).where('authors.active = ?', true).references(:author)

posts.each do |post|
  puts post.author.name  # no extra query
end
```