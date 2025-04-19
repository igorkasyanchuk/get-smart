## 📍 Tag and Filter Logs with TaggedLogging

Rails TaggedLogging helps you group and filter log entries by custom tags (e.g., request IDs, user IDs), making it easier to isolate relevant lines when debugging concurrent requests. Wrap blocks of code or entire controllers to automatically annotate logs.

```ruby
# config/environments/development.rb
config.log_tags = [ :request_id, ->(req) { req.params['user_id'] } ]

# Sample logs:
# [f65e3a1c] [user_id=42] SQL (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1
```

You can also tag manually:

```ruby
Rails.logger.tagged("PaymentProcessor") do
  Rails.logger.info("Starting payment for user #{current_user.id}")
end
```