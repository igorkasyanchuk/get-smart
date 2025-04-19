## 🔄 Automate EXPLAIN ANALYZE for Query Diagnostics
Integrate `EXPLAIN ANALYZE` into your test suite or logs to detect regressions in query performance. Wrap your ActiveRecord relation with a custom method that logs the execution plan, helping maintainers or CI catch unexpected slowdowns.

```ruby
def explain_analyze(relation)
  sql = "EXPLAIN ANALYZE #{relation.to_sql}"
  puts ActiveRecord::Base.connection.execute(sql).values.join("\n")
end

explain_analyze(User.where(active: true))
``` 

Proactively monitoring plans ensures performance budgets are respected as the schema or data volumes evolve.