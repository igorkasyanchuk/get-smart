## 🔍 Using Scopes for Cleaner Queries

Scopes encapsulate common query logic in your model, making controllers and views cleaner. Define a scope with a lambda for reusable ActiveRecord queries.

```ruby
class Article < ApplicationRecord
  # Scope for published articles
  scope :published, -> { where(published: true).order(published_at: :desc) }

  # Scope with argument
  scope :by_author, ->(user_id) { where(user_id: user_id) }
end
```

Call `Article.published` or `Article.by_author(current_user.id)` to fetch filtered results.