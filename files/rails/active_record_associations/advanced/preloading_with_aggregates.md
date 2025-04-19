## 🚀 Preloading Aggregated Data via Association
Leverage `has_many` with a custom select to preload aggregated metrics (e.g., counts, sums) in a single query. This pattern avoids post-processing in Ruby and keeps your views snappy.

```ruby
class User < ApplicationRecord
  has_many :orders
  has_many :order_summaries,
           -> { select('user_id, COUNT(*) AS total_orders, SUM(amount) AS total_spent').group('user_id') },
           class_name: 'Order'
end

users = User.includes(:order_summaries)
users.each do |u|
  summary = u.order_summaries.first
  puts "#{u.name} placed #{summary.total_orders} orders worth $#{summary.total_spent}"
end
```