## ⚙️ Polymorphic Counter Cache with Custom Column

Implement a counter cache on polymorphic associations by providing a custom column name and callback override. This optimizes reads in high-traffic systems.

```ruby
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, counter_cache: :comments_count
end

class Post < ApplicationRecord
  # Ensure comments_count integer column exists
  has_many :comments, as: :commentable
end
```

Add migrations to maintain the custom counter and manually reset caches with:

```ruby
def reset_comments_count
  Post.find_each { |p| Post.reset_counters(p.id, :comments) }
end
```
