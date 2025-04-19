## 🧠 Leverage Common Table Expressions (CTEs)
CTEs (WITH clauses) allow you to structure complex queries in a modular, readable way. ActiveRecord 6+ supports CTEs natively, enabling you to define subqueries for reusability and clarity, especially when chaining multiple derived tables.

```ruby
User.with_recent_logins(
  ":WITH recent_logins AS (
    SELECT user_id, MAX(created_at) AS last_login
    FROM logins GROUP BY user_id
  )"
)
.select('users.*', 'recent_logins.last_login')
.joins('INNER JOIN recent_logins ON recent_logins.user_id = users.id')
``` 

Organizing subqueries as CTEs improves maintainability and often helps the planner optimize execution.