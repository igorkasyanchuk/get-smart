## 🔍 Eager-Load Nested Polymorphic Associations
ActiveRecord’s `includes` can be combined with nested polymorphic associations to prevent N+1 queries even in complex models. You can specify a lambda to filter which polymorphic type to eager-load, reducing memory overhead and improving performance. This is crucial for dashboards or reports that traverse multiple layers of polymorphic relationships.

```ruby
# Assuming Comment belongs_to :commentable, polymorphic: true
Post.includes(comments: :commentable)
    .where(comments: { commentable_type: 'Image' })
    .references(:comments)
```

You can replace `.references(:comments)` with a scope to only fetch necessary columns or add conditions on the polymorphic target.