## 💨 Asynchronous Query Loading with load_async

Rails 7+ lets you kick off multiple queries in parallel via `load_async`. This can hide IO latency when you need to fetch associated records across multiple tables.

```ruby
class DashboardController < ApplicationController
  def index
    users_query    = User.where(active: true).load_async
    articles_query = Article.recent.limit(50).load_async

    @users    = users_query.records
    @articles = articles_query.records
  end
end
```

Under the hood, Rails uses a thread pool to fire both SQL calls concurrently, reducing total wall‑clock time significantly under moderate load.