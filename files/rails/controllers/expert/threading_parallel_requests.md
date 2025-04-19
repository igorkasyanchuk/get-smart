## ⚙️ Parallelizing External API Calls with Threads

Reduce overall latency by launching multiple external requests concurrently within your controller. Use Ruby threads and ensure proper exception handling and thread.join to synchronize results before rendering.

```ruby
class DashboardController < ApplicationController
  def show
    results = {}

    threads = {
      sales: Thread.new { results[:sales] = SalesApi.fetch_stats },
      users: Thread.new { results[:users] = UserApi.fetch_overview }
    }

    threads.each { |_k, t| t.join }

    render json: results
  end
end
```