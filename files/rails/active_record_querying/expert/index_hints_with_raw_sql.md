## 🛠️ Use Index Hints for Forced Index Selection
PostgreSQL doesn’t natively support index hints, but you can emulate them in MySQL or use `FORCE INDEX` in raw SQL for edge-case performance tuning. ActiveRecord’s `from` and `joins` accept raw SQL fragments for this purpose.

```ruby
User.from('users FORCE INDEX (idx_users_on_email)')
    .where(email: 'alice@example.com')
``` 

While use of hints should be rare and only after careful `EXPLAIN ANALYZE` investigation, they can rescue unexpectedly slow queries when the planner picks a suboptimal plan.