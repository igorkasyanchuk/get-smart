## 🛡️ Safe Raw SQL with Bind Parameters

When you need to execute complex SQL not covered by ActiveRecord, use parameter binding to avoid SQL injection. Bind parameters ensure that input values are properly escaped by the database adapter.

```ruby
user_id = params[:user_id]
results = ActiveRecord::Base.connection.exec_query(
  "SELECT * FROM users WHERE id = $1 AND active = $2",  
  "SQL", 
  [[nil, user_id], [nil, true]]
)
```

This uses positional parameters (`$1`, `$2`) and an array of bind values, preventing malicious input from altering the query structure.