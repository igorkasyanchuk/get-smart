## 🐎 Run Migrations in Parallel to Reduce Downtime

For microservices or multi-tenant setups, you can execute independent migrations in parallel using a custom Rake task:

```ruby
task parallel_migrate: :environment do
  schemas = %w[tenant1 tenant2 tenant3]
  threads = schemas.map do |schema|
    Thread.new do
      ActiveRecord::Base.connection.schema_search_path = schema
      Rake::Task['db:migrate'].invoke
    ensure
      Rake::Task['db:migrate'].reenable
    end
  end
  threads.each(&:join)
end
```

This reduces total migration time across multiple schemas, but be cautious of connection pool sizing.