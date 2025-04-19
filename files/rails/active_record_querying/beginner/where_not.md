## ❌ Excluding Records with `where.not`

`where.not` filters out records matching the given condition. It’s the inverse of `where` and helps you exclude unwanted data. Combine with other query methods for refined results.

```ruby
# Get all users who are not admins
non_admins = User.where.not(role: 'admin')

# Exclude archived posts
active_posts = Post.where.not(status: 'archived')
```