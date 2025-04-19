## 💾 Log ActiveRecord SQL with Bind Values
By default, Rails logs SQL statements but masks bind parameters. To include binds (useful for performance debugging), enable detailed query logs:

```ruby
# config/environments/development.rb
Rails.application.configure do
  config.active_record.verbose_query_logs = true
end
```

This will annotate SQL logs with the file and line that triggered the query and show the actual values:
```
User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1  [["id", 42]]  app/controllers/users_controller.rb:10
```