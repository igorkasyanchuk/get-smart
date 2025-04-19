## 🔍 Benchmark and Explain ActiveRecord Queries

When you need to squeeze out extra performance, combine Ruby’s `Benchmark` with ActiveRecord’s `explain` to measure and analyze query plans on the fly. This helps you catch slow joins, missing indexes, and N+1 problems without leaving the console.

```ruby
require 'benchmark'

# Measure wall time for a complex query
ms = (Benchmark.realtime do
  users = User.includes(:posts, :comments)
              .where(active: true)
              .where('posts.created_at > ?', 1.week.ago)
              .to_a
end * 1000).round(1)
puts "Loaded [32m#{users.size}[0m users in #{ms}ms"

# Print the query plan
puts User.includes(:posts, :comments)
         .where(active: true)
         .where('posts.created_at > ?', 1.week.ago)
         .explain
```