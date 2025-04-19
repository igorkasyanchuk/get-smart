## 📝 Define Dynamic Scopes

Use lambda-based scopes to encapsulate common query logic and keep your models clean. Lambdas ensure the scope is re-evaluated each time, preventing stale query fragments.

```ruby
class Article < ApplicationRecord
  scope :published, -> { where(published: true) }
  scope :recent,    ->(days = 7) { where('created_at >= ?', days.days.ago) }
end

# Usage:
Article.published.recent(3)
```