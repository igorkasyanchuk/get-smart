## ⚡ Caching Heavy Helper Computations

Use Rails cache to store expensive helper results and dramatically improve view rendering performance. By keying on model attributes or parameters, you ensure fresh data when underlying records change.

```ruby
# app/helpers/analytics_helper.rb
module AnalyticsHelper
  def user_report(user)
    Rails.cache.fetch([:user_report, user.id, user.updated_at.to_i], expires_in: 6.hours) do
      # Perform heavy data aggregation, SQL queries, or API calls
      compute_user_metrics(user)
    end
  end

  private

  def compute_user_metrics(user)
    # heavy logic here
  end
end
```
