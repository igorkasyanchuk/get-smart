## 🔍 Use Scopes for Reusable Queries

Scopes let you encapsulate common query logic in your models, making controllers and services cleaner. Define scopes for frequently used filters or orderings to avoid repeating `where` and `order` clauses across your app. Scopes return an `ActiveRecord::Relation`, so you can chain them together for maximum flexibility.

```ruby
class Article < ApplicationRecord
  scope :published, -> { where(published: true) }
  scope :recent,    -> { order(published_at: :desc) }
end

# Usage:
Article.published.recent.limit(5)
```