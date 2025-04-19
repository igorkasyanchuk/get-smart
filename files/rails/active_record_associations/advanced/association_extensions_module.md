## 📦 Association Extensions for Custom Methods
Extend `has_many` associations with custom methods by passing a block or module. This encapsulates reusable logic directly on the association proxy, keeping controllers and models DRY.

```ruby
# app/models/concerns/commentable_extensions.rb
module CommentableExtensions
  extend ActiveSupport::Concern

  included do
    has_many :comments do
      def recent(limit = 5)
        where('created_at > ?', 1.week.ago).limit(limit)
      end
    end
  end
end

class Article < ApplicationRecord
  include CommentableExtensions
end

# Usage:
article.comments.recent(3)
```