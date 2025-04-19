## 🚀 Optimize N+1 Queries with Eager Loading
By default, ActiveRecord can issue one query per associated record, leading to N+1 issues. In controllers, preload associations to avoid excessive database hits. Use `includes` or `eager_load` when fetching collections, especially for JSON APIs or index pages.

```ruby
class PostsController < ApplicationController
  def index
    # Preloads comments and author in a single query
    @posts = Post.includes(:comments, :author).order(created_at: :desc)
    render json: @posts.to_json(include: [:comments, :author])
  end
end
```

You can also scope your eager loading to specific attributes:
```ruby
@posts = Post.includes(comments: [:user]).select(:id, :title, :created_at)
```