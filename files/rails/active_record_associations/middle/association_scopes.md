## 🔍 Scoping Associations for Reusable Queries

Define default scopes on associations using a lambda to create reusable, filtered relationships. This keeps query logic DRY and located in the model rather than scattered in controllers.

```ruby
class Post < ApplicationRecord
  has_many :published_comments, -> { where(published: true).order(created_at: :desc) }, class_name: "Comment"
end

# Fetch only published comments ordered newest first:
post.published_comments
```
