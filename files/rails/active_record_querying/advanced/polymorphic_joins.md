## 🔀 Join Multiple Polymorphic Associations
When you need to join a polymorphic association to several parent tables, use conditional joins in SQL. This allows you to eager load data from different types in one query.

```ruby
# Comments can belong to articles or photos
data = Comment
  .joins("LEFT JOIN articles ON comments.commentable_id = articles.id AND comments.commentable_type = 'Article'")
  .joins("LEFT JOIN photos ON comments.commentable_id = photos.id AND comments.commentable_type = 'Photo'")
  .select('comments.*', 'articles.title AS article_title', 'photos.filename AS photo_file')
```
