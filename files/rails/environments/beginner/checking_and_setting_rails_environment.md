## 🔧 Checking and Setting the Rails Environment

Knowing which environment your app is running in helps you debug and configure features correctly. You can inspect `Rails.env` in code or the Rails console, and you can change it by exporting `RAILS_ENV` before commands. This is especially useful for running migrations or tests under a specific environment.

```ruby
# In Rails console, check current environment
echo Rails.env  # => "development"

# Run migrations in test environment
environment RAILS_ENV=test do
  bin/rails db:migrate
end
```

By explicitly setting the environment, you avoid accidentally modifying your development or production databases when running tasks.