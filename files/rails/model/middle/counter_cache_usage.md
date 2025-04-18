## 📊 Use `counter_cache` to optimize counting associated records

Add a `counter_cache` to avoid expensive COUNT queries:

```ruby
class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end

class Post < ApplicationRecord
  # Ensure posts table has comments_count integer column
end
```

Now `post.comments_count` is automatically updated by Rails, speeding up count access.